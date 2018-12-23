#define add_model
/// Model add_model(internal name, name, main, collision, block, [description], [on hit], [render distance], [is terrain?], [is plant?], [format], [textured?]);

with (instantiate(Model)){
    switch (argument_count){
        case 12:
            textured=argument[11];
        case 11:
            format=argument[10];
        case 10:
            flag=flag|clamp(argument[9], 0, 1)<<ModelFlags.is_plant;
        case 9:
            flag=flag|clamp(argument[8], 0, 1)<<ModelFlags.is_terrain;
        case 8:
            model_render_distance=argument[7];
        case 7:
            on_hit=argument[6];
        case 6:
            summary=argument[5];
        default:
            internal_name=argument[0];
            name=argument[1];
            if (string_length(argument[2])>0){
                archive=World.active_vra_container.name;
                model_array[0]=const_model_get(argument[2]);
                path[0]=argument[2];
            }
            cpath=argument[3];
            if (string_length(argument[4])>0){
                block=const_block_get(argument[4]);
            }
    }
    
    if (string_length(cpath)>0){
        shape=const_model_get(cpath);
    }
    
    return id;
}

#define add_model_alt
/// Model add_model_alt(array, model index, path0, path1, .. pathn);

var arr=argument[0];

with (arr[argument[1]]){
    var start=array_length_1d(model_array);
    for (var i=argument_count-2; i>=2; i--){
        path[start+i-2]=argument[i];
        model_array[start+i-2]=const_model_get(argument[i]);
    }
    
    // Nothing is done with the triangle count because this is intended only for alternate 'skins' of models that otherwise
    // have the same collision information.
    
    return id;
}

#define add_model_header
/// Model add_model_header(name, description, [color]);

with (add_model(string_lettersdigits(argument[0]), argument[0], "", "", "", argument[1])){
    if (argument_count>2){
        color=argument[2];
    } else {
        color=c_blue;
    }
    selectable=false;
    
    save_script=model_write_header;
    
    return id;
}