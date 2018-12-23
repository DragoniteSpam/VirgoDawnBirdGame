/// void draw_cursor(x, y);

with (World){
    var b=crosshair_array[crosshair_index];
    var s=background_get_width(b)/2;
    // This is assuming a square. If you add any non-square crosshairs, they won't be displayed properly.
    draw_background(b, argument0-s, argument1-s);
}
