var xref=W-320;
draw_rectangle_texture_auto(xref, 32, W-32, 128, true);
if (c_hit_object(0)!=-1){
    var n=c_object_get_userid(c_hit_object());
} else {
    var n="n/a";
}
draw_text(xref+16, 32, "Under cursor:#"+string(n));
