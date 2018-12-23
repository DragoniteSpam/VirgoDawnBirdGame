/// void EventRadius.draw_radius([texture]);

if (mode==GameModes.play){
    return false;
} else if (argument_count>0){
    var tex=argument[0];
} else {
    var tex=tex_default;
}

draw_model(tex);
draw_set_alpha(0.5);
d3d_draw_ellipsoid(x-radius, y-radius, z-radius, x+radius, y+radius, z+radius, tex, 0, 0, 16);
draw_set_alpha(1);
