/// editor_hud_database_resource_item_model_list(resource);

var catch=argument0;
var base_item=ds_map_find_value(all_mod_packages, edit_database_package).my_items[edit_database_active];
var arr=ds_map_find_value(all_mod_packages, base_item.model_package).my_models;

for (var i=0; i<array_length_1d(arr); i++){
    if (string_length(edit_database_filter)==0||string_count(edit_database_filter, arr[i].name)>0){
        ds_list_add(edit_database_filter_list, i);
    }
}
