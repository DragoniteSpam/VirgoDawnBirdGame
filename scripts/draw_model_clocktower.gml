/// void Entity.draw_model_clocktower([texture]);

var base=model;
var mdl=get_model_object();
var show=false;
var ind=model_index;
var tex=tex_default;
switch (argument_count){
    case 1:
        tex=argument[0];
        break;
}

var minute_angle=360-(game_current_minute+game_current_second/60)/60*360;
var hour_angle=360-(game_current_hour+game_current_minute/60)/12*360;
var package=ds_map_find_value(all_mod_packages, mod_package);

draw_set_transform_stack();
d3d_model_draw_selective(mdl.model_array[ind], 0, 0, 0, tex, mod_package, base);
d3d_transform_set_scaling(hand_xscale, hand_yscale, hand_zscale);
d3d_transform_stack_push();
d3d_transform_add_rotation_x(xrot+minute_angle);
d3d_transform_add_rotation_y(yrot);
d3d_transform_add_rotation_z(direction+90);
d3d_transform_add_translation(x+hand_x, y+hand_y, z+hand_z);
d3d_model_draw_selective(package.my_models[World.mdl_clock_hand_minute].model_array[0], 0, 0, 0, tex, mod_package, World.mdl_clock_hand_minute);
d3d_transform_stack_pop();
d3d_transform_add_translation(1, 0, 0);
d3d_transform_add_rotation_x(xrot+hour_angle);
d3d_transform_add_rotation_y(yrot);
d3d_transform_add_rotation_z(direction+90);
d3d_transform_add_translation(x+hand_x, y+hand_y, z+hand_z);
d3d_model_draw_selective(package.my_models[World.mdl_clock_hand_hour].model_array[0], 0, 0, 0, tex, mod_package, World.mdl_clock_hand_hour);
draw_reset_transform_stack();
