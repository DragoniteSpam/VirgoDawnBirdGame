/// load_teleport(file);

load_entity(argument0);

if (ds_map_exists(argument0, "var_map_package")){
    var_map_package=argument0[? "var_map_package"];
}

var_map=argument0[? "var_map"];
var_marker=min(argument0[? "var_marker"], ds_grid_width(teleport_spots)-1);
var_key=argument0[? "var_key"];

if (is_undefined(var_key)){
    var_key=Items.NONE;
}
