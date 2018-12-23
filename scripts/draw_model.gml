/// void Entity.draw_model([texture], [show hidden items?], [mod package], [model], [model index], [auto transform?]);

var mdl=get_model_object();
if (mdl.textured){
    var tex=tex_default;
} else {
    var tex=-1;
}
var show=false;
var ind=model_index;
var package=BASE_ASSET;
var base=model;
var auto_transform=true;

switch (argument_count){
    case 6:
        auto_transform=argument[5];
    case 5:
        ind=argument[4];
    case 4:
        base=argument[3];
        package=argument[2];
        mdl=ds_map_find_value(all_mod_packages, package).my_models[base];
    case 3:
        // you cant pass it only 3 arguments because that doesnt make sense
    case 2:
        show=argument[1];       // this is the old way of doing things
    case 1:
        tex=argument[0];
        break;
}

show=(Player.timer_revelation>0);  // this is the new way of doing things

if (auto_transform){
    draw_set_transform_stack();
}

if (hidden){
    // @todo Outline shader?
    if (show&&point_distance(x, y, Camera.x, Camera.y)<RD_NEAR*global_particle_density||World.game_mode_is_debug[mode]){
        shader_set(shd_alpha_brightness);
        shader_set_uniform_f(World.shd_alpha_brightness_alpha, World.game_mode_is_debug[mode]+min(Player.timer_revelation/60, REVELATION_ALPHA));
        shader_set_uniform_f(World.shd_alpha_brightness_brightness, REVELATION_BRIGHTNESS);
        d3d_model_draw_selective(mdl.model_array[ind], 0, 0, 0, tex, mod_package, base);
        World.draw_calls++;
        shader_reset();
    }
} else {
    if (draw_mode==Misc.block||draw_mode==Misc.model_and_wireframe){
        d3d_model_draw_selective(mdl.block, 0, 0, 0, -1, mod_package, base);
    } else {
        d3d_model_draw_selective(mdl.model_array[ind], 0, 0, 0, tex, mod_package, base);
    }
    World.draw_calls++;
}

if (World.selected==id){
    draw_hit_zone();
}

if (auto_transform){
    draw_reset_transform_stack();
}
