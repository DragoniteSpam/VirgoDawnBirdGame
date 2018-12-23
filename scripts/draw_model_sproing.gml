/// void Entity.draw_model_flag([texture, show hidden items?]);

var base=model;
if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

var zscale=1+dsin(6*spring_time)/10;
matrix_set(matrix_world, matrix_multiply(matrix_build(x, y, z, xrot, yrot, direction, scale, scale, zscale/scale), matrix_get(matrix_world)));
d3d_model_draw_selective(get_model(), 0, 0, 0, t, mod_package, base);
draw_reset_transform_stack();

if (World.selected==id){
    matrix(sproing_target_x, sproing_target_y, sproing_target_z, 0, 0, 0, 1, 1, 1);
    d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_npc].model_array[0], 0, 0, 0, -1, BASE_ASSET, base);
    draw_reset_transform_stack();
}
