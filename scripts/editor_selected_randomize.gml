if (show_question("This will randomize model indices for all checked entities. Continue?")){
    with (Entity){
        if (object_index==Entity){
            if (checked){
                var m=ds_map_find_value(all_mod_packages, mod_package).my_models[model];
                model_index=irandom(array_length_1d(m.model_array)-1);
            }
        }
    }
}
