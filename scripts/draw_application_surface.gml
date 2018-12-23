if (world_h_flip){
    var xst=W;
    var xscl=-1;
} else {
    var xst=0;
    var xscl=1;
}
if (world_v_flip){
    var yst=H;
    var yscl=-1;
} else {
    var yst=0;
    var yscl=1;
}
draw_surface_ext(application_surface, xst, yst, xscl, yscl, 0, c_white, 1);
shader_reset();
