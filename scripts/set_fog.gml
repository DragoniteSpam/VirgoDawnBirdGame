/// void set_fog(enable?);

if (World.game_mode_is_debug[mode]){
    d3d_set_fog(false, c_black, 0, 1);
    return false;
}

var f=render_distance/96;
var tod=1;  // tried making the fog roll in at night but that was just too much work
var map_factor=lm.map_render_distance/RD_STANDARD;
var start_f=ternary(lm.map_render_distance==RD_STUPIDLY_NEAR, 0, 1);
d3d_set_fog(argument0, background_color, lm.fog_start*tod*map_factor*start_f, f*lm.fog_end*tod*map_factor);
