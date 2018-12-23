var base_item=ds_map_find_value(all_mod_packages, edit_database_package).my_items[edit_database_active];

return ds_map_find_value(all_mod_packages, base_item.model_package).my_models[edit_database_filter_list[| argument0]].name;
