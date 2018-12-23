d3d_transform_set_rotation_z(angle);
d3d_transform_add_translation(x, y, z);
d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_confusion].model_array[0], 0, 0, 0, tex_default, BASE_ASSET, World.mdl_confusion);
draw_reset_transform_stack();
World.triangles_fx+=192;
World.draw_fx++;
angle=angle+rate;
