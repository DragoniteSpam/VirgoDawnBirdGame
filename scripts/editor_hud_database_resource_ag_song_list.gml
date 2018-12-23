/// editor_hud_database_resource_ag_package_list(resource);

var catch=argument0;

var arr=ds_map_find_value(all_mod_packages, argument0.packages[| edit_database_ag_song_index]).my_bgm;

for (var i=0; i<array_length_1d(arr); i++){
    if (string_length(edit_database_filter)==0||string_count(edit_database_filter, arr[i].name)>0){
        ds_list_add(edit_database_filter_list, i);
    }
}
