/// load_pressure_plate(file);

load_entity(argument0);

action=argument0[? "action"]

if (ds_map_exists(argument0, "action_package")){
    action_package=argument0[? "action_package"];
}
