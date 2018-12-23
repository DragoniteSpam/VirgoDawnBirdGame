var package=get_string("Mod package to look in?", BASE_ASSET);
if (string_length(get_mod_package_from_name(package, ""))>0){
    var mp=ds_map_find_value(all_mod_packages, package);
    var m=get_model_from_name(package, get_string("Model to select all of?", "None"), noone);
    
    if (m!=noone){
        if (show_question("This will select all instances of "+mp.my_models[m].name+". Continue?")){
            with (Entity){
                if (object_index==Entity){
                    checked=(model==m);
                }
            }
        }
    }
}
