/// load_door(file);

load_entity(argument0);

state=argument0[? "state"];
swing_speed=argument0[? "swing_speed"];
swing_direction=argument0[? "swing_direction"];
target_direction=argument0[? "target_direction"];

if (ds_map_exists(argument0, "lock_index")){
    lock_index=argument0[? "lock_index"];
}

if (ds_map_exists(argument0, "lock_item_package")){
    lock_item_package=argument0[? "lock_item_package"];
}

if (ds_map_exists(argument0, "lock_item")){
    lock_item=argument0[? "lock_item"];
}
