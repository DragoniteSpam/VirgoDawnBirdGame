/// Entity add_entity(model enum, model form index, x, y, z, [type], [ignore active location]);

if (argument_count<7||!argument[6]){
    if (World.edit_map_active_location==noone){
        show_message("You haven't set an Active Location yet! Go do that in Map Settings before adding anything else, will you?");
    }
}

var type=Entity;
switch (argument_count){
    case 7:
    case 6:
        type=argument[5];
        break;
}

with (instance_create(argument[2], argument[3], type)){
    var m=ds_map_find_value(all_mod_packages, mod_package).my_models[argument[0]];
    name=m.name;
    model=argument[0];
    model_index=argument[1];
    z=argument[4];
    lerp_target_z=z;
    on_hit=m.on_hit;
    script_execute(collision_adder, id);
    
    World.edit_object_last_added=argument[0];
    
    return id;
}
