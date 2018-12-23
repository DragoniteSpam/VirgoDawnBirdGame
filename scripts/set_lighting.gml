/// void set_lighting(enable?);

with (World){
    if (game_mode_is_debug[mode]&&!editor_lighting){
        d3d_set_lighting(false);
        return false;
    }
    
    d3d_set_lighting(argument0)
    if (!lm.is_indoors){
        if (dsin(SUN_ANGLE)>0){
            d3d_light_define_direction(Misc.sun, dcos(SUN_ANGLE), 1, -dsin(SUN_ANGLE), weather.light_color)
            d3d_light_enable(Misc.sun, true);
        } else {
            d3d_light_enable(Misc.sun, false);
        }
    }
    d3d_light_define_point(Misc.camera, Camera.x, Camera.y, Camera.z, lm.fog_start, weather.light_color);
    d3d_light_enable(Misc.camera, true);
    
    for (var i=0; i<ds_list_size(list_point_lights); i++){
        var light=list_point_lights[| i];
        if (instance_exists(light)){
            d3d_light_define_point(i+Misc.camera+1, light.x+light.offset_light_x, light.y+light.offset_light_y,
                            light.z+light.offset_light_z+16, light.range_default+random(light.range_flicker), weather.light_color);
            d3d_light_enable(i+Misc.camera+1, true);
        }
    }
    
    for (var i=ds_list_size(list_point_lights); i<6; i++){
        d3d_light_enable(i+Misc.camera+1, false);
    }
}
