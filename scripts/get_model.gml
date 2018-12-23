#define get_model
/// model Entity.get_model([entity]);

if (argument_count==0){
    return get_model_object().model_array[model_index];
}

return get_model_object(argument[0]).model_array[model_index];

#define get_model_object
/// model Entity.get_model_object([entity]);

if (argument_count==0){
    return ds_map_find_value(all_mod_packages, mod_package).my_models[model];
}

return ds_map_find_value(all_mod_packages, argument[0].mod_package).my_models[argument[0].model];