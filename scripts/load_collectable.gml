/// load_collectable(file);

load_entity(argument0);

value=ds_map_find_value(argument0, "value");

if (is_undefined(value)){
    value=1;
}

// do not disturb
model=World.mdl_feather;
model_index=irandom(array_length_1d(ds_map_find_value(all_mod_packages, mod_package).my_models[World.mdl_feather].model_array)-1);

c_world_remove_object(object);
script_execute(collision_adder, id);
