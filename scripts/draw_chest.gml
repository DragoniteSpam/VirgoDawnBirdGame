/// Entity.draw_chest([texture]);

if (argument_count==0){
    draw_model();
    if (state==Misc.open){
        target_angle=-120;
    } else {
        target_angle=0;
    }
    angle=lerp(angle, target_angle, 0.1);
    var top=ds_map_find_value(all_mod_packages, mod_package).my_models[World.mdl_chest_top];
    matrix(x, y, z+12, angle, 0, direction, 1, 1, 1);
    d3d_model_draw_selective(top.model_array[model_index], 0, 0, 0, tex_default, BASE_ASSET, World.mdl_chest_top);
    World.draw_calls++;
    draw_reset_transform_stack();
} else {
    draw_model(argument[0]);
}
