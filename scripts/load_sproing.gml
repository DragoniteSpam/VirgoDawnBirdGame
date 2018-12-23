/// load_door(file);

load_entity(argument0);

sproing_target_x=argument0[? "sproing_target_x"];
sproing_target_y=argument0[? "sproing_target_y"];
sproing_target_z=argument0[? "sproing_target_z"];
sproing_target_height=argument0[? "sproing_target_height"];

if (ds_map_exists(argument0, "sproing_equation")){
    sproing_equation=argument0[? "sproing_equation"];
}
