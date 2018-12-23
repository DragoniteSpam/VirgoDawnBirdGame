var n=array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_models);
var model=add_model("Model"+string(n+1), "Model "+string(n+1), "", "", "");
(ds_map_find_value(all_mod_packages, edit_database_package)).my_models[n]=model;

return model;
