/// void draw_rectangle_texture_auto(x, y, x2, y2, outline?);

var c=graphics_final_color;

draw_rectangle_colour(argument0, argument1, argument2, argument3, c, c, c, c, false);
draw_background_part_ext(b_auto_texture, 0, 0, argument2-argument0, argument3-argument1, argument0, argument1, 1, 1, graphics_white_color, draw_get_alpha());

if (argument4){
    draw_rectangle_colour(argument0, argument1, argument2, argument3, c_black, c_black, c_black, c_black, true)
}
