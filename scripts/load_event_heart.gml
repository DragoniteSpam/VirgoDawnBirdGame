/// load_event_heart(file);

load_event(argument0);

if (ds_map_exists(argument0, "heal_full")){
    heal_full=argument0[? "heal_full"];
}

// do not disturb
model=World.mdl_heart;
model_index=0;

c_world_remove_object(object);
script_execute(collision_adder, id);
