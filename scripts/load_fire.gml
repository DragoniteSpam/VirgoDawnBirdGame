/// load_door(file);

load_entity(argument0);

lit=argument0[? "lit"];
scale=argument0[? "scale"];
density=argument0[? "density"];

offset_light_x=argument0[? "olx"];
offset_light_y=argument0[? "oly"];
offset_light_z=argument0[? "olz"];

range_default=argument0[? "range_default"];
range_flicker=argument0[? "range_flicker"];

if (is_undefined(offset_light_x)){
    offset_light_x=0;
}
if (is_undefined(offset_light_y)){
    offset_light_y=0;
}
if (is_undefined(offset_light_z)){
    offset_light_z=0;
}
if (is_undefined(range_default)){
    range_default=128;
}
if (is_undefined(range_flicker)){
    range_flicker=16;
}
