/// void EventCard.draw_card([texture]);

if (argument_count==0){
    var tex=tex_default;
} else {
    var tex=argument[0];
}

matrix(x, y, z, 0, 0, World.frames%360, 1, 1, 1);

d3d_model_draw_selective(ds_map_find_value(all_mod_packages, mod_package).my_models[World.mdl_card].model_array[0], 0, 0, 0, tex, mod_package, World.mdl_card);

draw_reset_transform_stack();
World.draw_calls++;
