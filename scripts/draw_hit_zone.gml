var hitzone_model=ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_hitzone];

for (var i=0; i<4; i++){
    var hit=1<<i;
    if (hit_flags&hit){
        matrix(x, y, z+8, 0, 0, i*90+direction, 2, 2, 2);
        d3d_model_draw_selective(hitzone_model.model_array[0], 0, 0, 0, -1, BASE_ASSET, World.mdl_hitzone);
        draw_reset_transform_stack();
        World.draw_calls++;
    }
}
