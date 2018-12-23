#define compile
/// Arguments compile(line, cutscene, line number);

var previous_term="";
var previous_object="";
var q=split(argument0, " =.,#()+-/*"+'"', true);
var arg=instantiate(CutsceneScriptLine);
arg.line_number=argument2;
ds_list_add(argument1.line_status, CompilerStates.fine);
var failed=false;
while (!ds_queue_empty(q)){
    var term=ds_queue_dequeue(q);
    var next_term=ds_queue_head(q);
    // comment
    if (string_char_at(term, 1)=="#"){
        break;
    // compiler instructions: mod package
    } else if (string_starts_with(term, "$package")){
        if (next_term=="."){
            mod_package=BASE_ASSET;
        } else {
            mod_package=next_term;
        }
        arg.script=scr_set_package;
        arg.a=ds_list_create();
        var param=instantiate(Parameter);
        param.type=VariableTypes.str;
        param.value=mod_package;
        ds_list_add(arg.a, param);
    // Functions/methods
    } else if (next_term=="("/*&&previous_term=="."*/){
        var obj=noone;
        var method=null;
        if (ds_map_exists(World.entities, previous_object)){
            obj=World.entities[? previous_object];
        } else {
            print("Object not found: "+previous_object+" [line "+string(argument2)+"]. Defaulting to World.");
            argument1.line_status[| ds_list_size(argument1.line_status)-1]=CompilerStates.warning;
            obj=World;
        }
        if (!instance_exists(obj)){
            show_message("Instance not found: "+previous_object+". Compile failed.#(Maybe you deleted it, or moved out of range, or something?)");
            failed=true;
            break;
        } else if (ds_map_exists(obj.methods, term)){
            method=all_cutscene_scripts[obj.methods[? term]];
            if (obj.methods[? term]==CutsceneScripts.ifbranch){
                ds_stack_push(ifs, arg);
            } else if (obj.methods[? term]==CutsceneScripts.elsebranch){
                if (ds_stack_size(ifs)==0){
                    show_message("Else statement found without an if. Compile failed.");
                    failed=true;
                    break;
                }
                if (ds_stack_top(ifs).closed==noone){
                    (ds_stack_top(ifs)).closed=arg;
                } else {
                    show_message("If statement already linked with an else. Compile failed.");
                    failed=true;
                    break;
                }
            } else if (obj.methods[? term]==CutsceneScripts.endif){
                if (ds_stack_size(ifs)==0){
                    show_message("Endif statement found without an if. Compile failed.");
                    failed=true;
                    break;
                }
                if (ds_stack_top(ifs).closed==noone){
                    (ds_stack_top(ifs)).closed=arg;
                } else {
                    (ds_stack_top(ifs)).closed.closed=arg;
                }
                ds_stack_pop(ifs);
            }
            var param_string="";
            var enclosed=0;
            do {
                term=deq(q);
                param_string=param_string+term;
                if (term==")"){
                    enclosed--;
                } else if (term=="("){
                    enclosed++;
                }
            } until(term==")"&&enclosed==0);
            arg.script=method.script;
            arg.a=compile_parameters(string_copy(param_string, 2, string_length(param_string)-2), argument2, method, argument1);
            if (arg.a==noone){
                // the error message should already have showed up in compile_parameters
                failed=true;
            }
        } else {
            show_message("Unknown method: "+term+". Compile failed.");
            failed=true;
            break;
        }
        if (previous_object=="me"){
            arg.object=-1;
        } else {
            arg.object=obj;
        }
    // Assignment
    } else if (term=="="){
        if (string_length(arg.result)>0){
            show_message("Assignment already defined for line "+string(argument2)+". Compile failed.");
            failed=true;
        }
        if (!validate_variable(next_term)){
            show_message("Invalid variable name: "+next_term+"#on line "+string(argument2)+". Compile failed.");
            failed=true;
        }
        deq(q);
        if (ds_queue_size(q)>0){
            var unreachable="";
            while (!ds_queue_empty(q)){
                unreachable=unreachable+deq(q);
            }
            if (string_length(string_lettersdigits(unreachable))>0){
                print("Extraneous code: "+unreachable+" [line "+string(argument2)+"]. Discarding.");
                argument1.line_status[| ds_list_size(argument1.line_status)-1]=CompilerStates.warning;
            }
        }
        arg.result=next_term;
        // The end of valid code
        break;
    }
    previous_object=previous_term;
    previous_term=term;
}
ds_queue_destroy(q);

ds_list_add(argument1.compiled, arg);

if (failed){
    argument1.line_status[| ds_list_size(argument1.line_status)-1]=CompilerStates.error;
    instance_activate_object(arg);
    with (arg){
        instance_destroy();
    }
    return noone;
}

return arg;

#define compile_parameters
/// ds_list compile_parameters(parameter_string, line number, method, cutscene);

var enclosed=0;
var enclosed_string=false;
var list=ds_list_create();
var term="";
var failed=false;
var shownerror=false;

var parse_me=argument0;
if (string_char_at(parse_me, string_length(parse_me))!=","){
    parse_me=parse_me+",";
}

for (var i=1; i<=string_length(parse_me); i++){
    var c=string_char_at(parse_me, i);
    if (c=="("){
        enclosed++;
    } else if (c==")"){
        enclosed--;
    }
    if (c=='"'){
        if (enclosed_string){
            if (string_char_at(parse_me, i-1)=="\"){
                // escape character, ignore
            } else {
                enclosed_string=false;
            }
        } else {
            enclosed_string=true;
        }
    }
    if (enclosed==0&&c==","&&!enclosed_string){
        term=string_trim(term);
        if (string_length(term)>0){
            var param=instantiate(Parameter);
            // String
            if (string_char_at(term, 1)=='"'&&string_char_at(term, string_length(term))=='"'){
                param.type=VariableTypes.str;
                param.value=string_copy(term, 2, string_length(term)-2);
            // Booleans
            } else if (string_lower(term)=="true"){
                param.type=VariableTypes.boolean;
                param.value=true;
            } else if (string_lower(term)=="false"){
                param.type=VariableTypes.boolean;
                param.value=false;
            // Data types
            } else if (validate_model(term)){
                var str=string_replace(term, "Models.", "");
                param.type=VariableTypes.model;
                param.value=get_model_from_name(mod_package, str, Models.extra_npc);
            } else if (validate_color(term)){
                var str=string_replace(term, "Colors.", "");
                param.type=VariableTypes.color;
                param.value=get_color_from_name(str, Colors.WHITE);
            } else if (validate_weather(term)){
                var str=string_replace(term, "Weather.", "");
                param.type=VariableTypes.weather;
                param.value=get_weather_from_name(str, WeatherTypes.clear);
            } else if (validate_map_marker(term)){
                var str=string_replace(term, "MapMarkers.", "");
                param.type=VariableTypes.map_marker;
                param.value=get_map_marker_from_name(str, 0);
            } else if (validate_map(term)){
                var str=string_replace(term, "Maps.", "");
                param.type=VariableTypes.map;
                param.value=get_map_from_name(mod_package, str, Maps.patience);
            } else if (validate_mod_package(term)){
                var str=string_replace(term, "Packages.", "");
                param.type=VariableTypes.package;
                param.value=str;    // you could do get_mod_package_from_name but it's going to return a string anyway
            } else if (validate_bgm(term)){
                var str=string_replace(term, "BGM.", "");
                param.type=VariableTypes.bgm;
                param.value=get_bgm_from_name(mod_package, str, 0);
            } else if (validate_se(term)){
                var str=string_replace(term, "SE.", "");
                param.type=VariableTypes.se;
                param.value=get_se_from_name(str, SE.tone);
            } else if (validate_gender(term)){
                var str=string_replace(term, "Genders.", "");
                param.type=VariableTypes.gender;
                param.value=get_gender_from_name(str, CutsceneScriptPlayerGenders.owl);
            } else if (validate_movement_script(term)){
                var str=string_replace(term, "MovementScripts.", "");
                param.type=VariableTypes.movement_script;
                param.value=get_movement_script_from_name(str, CutsceneScriptMovementScripts.flyForwards);
            } else if (validate_quest(term)){
                var str=string_replace(term, "Quests.", "");
                param.type=VariableTypes.quest;
                param.value=get_quest_from_name(str, Quests.test);
            } else if (validate_achievement(term)){
                var str=string_replace(term, "Ach.", "");
                param.type=VariableTypes.achievement;
                param.value=get_achievement_from_name(str, 0);
            } else if (validate_item(term)){
                var str=string_replace(term, "Items.", "");
                param.type=VariableTypes.item;
                param.value=get_item_from_name(Compiler.mod_package, str, 0);
            } else if (validate_camera_plane(term)){
                var str=string_replace(term, "CameraPlanes.", "");
                param.type=VariableTypes.camera_plane;
                param.value=get_camera_plane_from_name(str, CameraPlanes.xaxis);
            } else if (validate_entity(term)){
                param.type=VariableTypes.entity;
                param.value=World.entities[? term];
            } else if (validate_interpolation_style(term)){
                param.type=VariableTypes.interpolation_style;
                param.value=get_interpolation_style_from_name(str, InterpolationStyles.smooth);
            } else if (validate_mobile_end_action(term)){
                param.type=VariableTypes.mobile_end_action;
                param.value=get_mobile_end_action_from_name(str, MobileEndActions.stop);
            } else if (validate_variable(term)){
                param.type=VariableTypes.any;
                param.value=term;
            } else {
                // Real number/expression
                param.type=VariableTypes.float;
                param.value=term;
            }
            ds_list_add(list, param);
            term="";
        }
    } else {
        term=term+c;
    }
}

// Too many or too few parameters or incorrect type of parameters

var wrong=false;

for (var i=0; i<ds_list_size(list); i++){
    if (i>=ds_list_size(argument2.param_types)){
        wrong=true;
        break;
    } else if (argument2.param_types[| i]==VariableTypes.any){
        // free pass
    } else if (list[| i].type==VariableTypes.float&&argument2.param_types[| i]==VariableTypes.boolean){
        // special case
    } else if (list[| i].type==VariableTypes.any&&argument2.param_types[| i]==VariableTypes.float){
        list[| i].type=VariableTypes.float;
    } else if ((list[| i].type!=argument2.param_types[| i])){
        wrong=true;
        break;
    }
}

if (wrong&&!shownerror){
    var actual_param_string="";
    for (var j=0; j<ds_list_size(list); j++){
        actual_param_string=actual_param_string+World.variable_type_names[list[| j].type];
        if (j+1<ds_list_size(list)){
            actual_param_string=actual_param_string+", ";
        }
    }
    var desired_param_string="";
    for (var j=0; j<ds_list_size(argument2.param_names); j++){
        if (argument2.param_required[| j]){
            var optional=false;
        } else {
            var optional=true;
        }
        if (optional){
            desired_param_string=desired_param_string+"[";
        }
        desired_param_string=desired_param_string+World.variable_type_names[argument2.param_types[| j]];
        if (optional){
            desired_param_string=desired_param_string+"]";
        }
        if (j+1<ds_list_size(argument2.param_names)){
            desired_param_string=desired_param_string+", ";
        }
    }
    show_message("Wrong parameters:#"+actual_param_string+"#for#"+desired_param_string+"#Compile failed.");
    failed=true;
    shownerror=true;
}

if (failed){
    for (var j=0; j<ds_list_size(list); j++){
        instance_activate_object(list[| j]);
        with (list[| j]){
            instance_destroy();
        }
    }
    ds_list_destroy(list);
    argument3.line_status[| argument1]=CompilerStates.error;
    return noone;
}

return list;