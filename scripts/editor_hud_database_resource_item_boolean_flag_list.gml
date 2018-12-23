/// editor_hud_database_resource_item_boolean_flag_list(resource);

var catch=argument0;

for (var i=0; i<array_height_2d(boolean_flags); i++){
    if (string_length(edit_database_filter)==0||string_count(edit_database_filter, boolean_flags[i, BF_NAME])>0){
        ds_list_add(edit_database_filter_list, i);
    }
}
