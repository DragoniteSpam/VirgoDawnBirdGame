/// draw_input(button, key, x, y, text, [color?])

draw_rectangle_texture_auto(argument[2]-104, argument[3]-24, argument[2]+104, argument[3]+48, true);

var width=string_width(control_keyboard_text[argument[1]]);
var text_start=argument[2]+40-width/2;
var button_mid=(argument[2]-104+text_start)/2;
draw_control_button(argument[0], button_mid, argument[3]);
draw_control_key(argument[1], argument[2]+40, argument[3]);

if (argument_count==6&&argument[5]){
    var c=c_blue;
} else {
    var c=c_black;
}
draw_text_colour(argument[2], argument[3]+32, argument[4], c, c, c, c, 1);
