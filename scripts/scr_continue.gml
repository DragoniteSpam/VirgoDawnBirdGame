var cutscene=cutscene_map[? argument0];

do {
    if (World.scene_index<ds_list_size(cutscene.compiled)){
        var arg=cutscene.compiled[| World.scene_index++];
        var calling_object;
        if (arg.object==-1){
            calling_object=World.cutscene;
        } else {
            calling_object=arg.object;
        }
        with (calling_object){
            var value=script_execute(arg.script, arg.a);
            if (string_length(arg.result)>0){
                World.variables[? arg.result]=value;
            }
        }
    } else {
        World.scene_index=0;
        if (World.cutscene.delete_after_scene){
            with (World.cutscene){
                instance_destroy();
            }
        }
        World.cutscene=noone;
        ds_map_clear(World.variables);
        World.keep_going=false;
    }
} until(!World.keep_going);
