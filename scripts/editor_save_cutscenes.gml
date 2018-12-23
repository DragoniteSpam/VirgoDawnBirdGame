var fn=get_save_filename("Cutscene files|*.vcs", "cutscenes.vcs");

if (fn!=''){
    var buffer=buffer_create(power(2, 20), buffer_grow, 1);
    buffer_write(buffer, buffer_f32, ds_list_size(all_cutscenes));
    for (var i=0; i<ds_list_size(all_cutscenes); i++){
        var map=ds_map_create();
        var cutscene=all_cutscenes[| i];
        map[? "name"]=cutscene.name;
        map[? "summary"]=cutscene.summary;
        map[? "id"]=cutscene.cutscene_id;
        buffer_write(buffer, buffer_string, ds_map_write(map));
        buffer_write(buffer, buffer_string, ds_list_write(cutscene.code));
        ds_map_destroy(map);
    }
    buffer_save_ext(buffer, fn, 0, buffer_tell(buffer));
    buffer_delete(buffer);
}
