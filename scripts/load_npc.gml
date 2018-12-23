/// load_npc(file);

load_entity(argument0);

movement_is_random=argument0[? "movement_is_random"];
turning_is_random=argument0[? "turning_is_random"];
movement_radius=argument0[? "movement_radius"];
walking_animation=argument0[? "walking_animation"];
direction_fix=argument0[? "direction_fix"];
turn_frequency=argument0[? "turn_frequency"];
movement_frequency=argument0[? "movement_frequency"];

if (ds_map_exists(argument0, "can_die")){
    can_die=argument0[? "can_die"];
}

if (ds_map_exists(argument0, "can_heal")){
    can_heal=argument0[? "can_heal"];
}

if (ds_map_exists(argument0, "aggro_level")){
    aggro_level=argument0[? "aggro_level"];
}

if (ds_map_exists(argument0, "combat_type")){
    combat_type=argument0[? "combat_type"];
}

if (ds_map_exists(argument0, "collision_r")){
    collision_r=argument0[? "collision_r"];
}

if (ds_map_exists(argument0, "collision_h")){
    collision_h=argument0[? "collision_h"];
}

x=xstart;
y=ystart;

model=World.mdl_npc;
model_index=0;
