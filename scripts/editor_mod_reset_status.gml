if (show_question("This will mark all asset mod statuses to be ignored when you save a mod file (until you make further changes). Okay?")){
    for (var i=0; i<array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_items); i++){
        (ds_map_find_value(all_mod_packages, edit_database_package)).my_items[i].mod_status=ModStatuses.leave;
    }
    
    for (var i=0; i<array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_models); i++){
        (ds_map_find_value(all_mod_packages, edit_database_package)).my_models[i].mod_status=ModStatuses.leave;
    }
}
