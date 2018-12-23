d3d_transform_set_rotation_z(World.frames);
d3d_transform_add_scaling(1, 1, alpha*64);
d3d_transform_add_translation(x, y, z);
alpha=lerp(alpha, target_alpha, 0.05);
d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_ufo_halo].model_array[0], 0, 0, 0, -1, BASE_ASSET, World.mdl_ufo_halo);
draw_reset_transform_stack();
World.triangles_fx+=64;
World.draw_fx++;
