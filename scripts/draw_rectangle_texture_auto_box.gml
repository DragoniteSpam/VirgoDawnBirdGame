/// void draw_rectangle_texture_auto_box(x, y, text, highlighted?, selectable, state);

draw_rectangle_texture_auto(argument0, argument1, argument0+128, argument1+24, true);
if (argument3){
    draw_text_colour(argument0+16, argument1+12, argument2, c_blue, c_blue, c_blue, c_blue, 1);
} else {
    draw_text(argument0+16, argument1+12, argument2);
}

if (mouse_within_rectangle(argument0, argument1, argument0+128, argument1+24)&&argument5>=0&&get_release_a()){
    argument4.editor_state=argument5;
}
