/// void draw_cursor_precise([x, y]);

if (argument_count==0){
    var xx=MOUSE_X;
    var yy=MOUSE_Y;
} else {
    var xx=argument[0];
    var yy=argument[1];
}

draw_triangle_colour(xx-1, yy, xx-8, yy-2, xx-8, yy+2, c_black, c_black, c_black, false);
draw_triangle_colour(xx+1, yy, xx+8, yy-2, xx+8, yy+2, c_black, c_black, c_black, false);
draw_triangle_colour(xx, yy-1, xx-2, yy-8, xx+2, yy-8, c_black, c_black, c_black, false);
draw_triangle_colour(xx, yy+1, xx-2, yy+8, xx+2, yy+8, c_black, c_black, c_black, false);
