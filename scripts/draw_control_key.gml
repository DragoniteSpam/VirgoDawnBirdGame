/// void draw_control_key(button, x, y, [draw box?]);

var label=control_keyboard_text[argument[0]];

if (argument_count==4&&argument[3]){
    var w=string_width(label);
    var h=string_height(label);
    var buffer=8;
    draw_rectangle_texture_auto(argument[1]-w/2-buffer, argument[2]-h/2-buffer,
        argument[1]+w/2+buffer, argument[2]+h/2+buffer, true);
}

draw_text(argument[1], argument[2], label);
