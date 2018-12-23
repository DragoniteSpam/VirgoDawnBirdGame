/// editor_hud_database_resource_model_hit_script_list(resource);

var catch=argument0;

for (var i=0; i<array_length_1d(all_hit_scripts); i++){
    if (string_length(edit_database_filter)==0||string_count(edit_database_filter, script_get_name(all_hit_scripts[i]))>0){
        ds_list_add(edit_database_filter_list, i);
    }
}
