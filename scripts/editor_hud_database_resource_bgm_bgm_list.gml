/// editor_hud_database_resource_bgm_bgm_list(resource);

var catch=argument0;

for (var i=0; audio_exists(i); i++){
    // cast to string in case the name comes back as 'undefined' and crashes the game
    var name=string(audio_get_name(i));
    if (string_starts_with(name, "bgm_")){
        ds_list_add(edit_database_filter_list, i);
    }
}
