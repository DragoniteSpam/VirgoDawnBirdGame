d3d_transform_set_scaling(scale, scale, 1);
d3d_transform_add_translation(x, y, z);
d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_ring].model_array[0], 0, 0, 0, -1, BASE_ASSET, World.mdl_ring);
draw_reset_transform_stack();
World.triangles_fx+=192;
World.draw_fx++;
scale=scale+rate;
