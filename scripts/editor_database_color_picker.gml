var model=argument0;

var start_x=W/4+128;
var start_y=128;
var end_x=W*3/4-128;
var end_y=H-128;
draw_rectangle_texture_auto(start_x, start_y, end_x, end_y, true);
draw_text(start_x+32, start_y+32, "Pick a color:");
var sw=string_width("Pick a color: ");
draw_rectangle_colour(start_x+32+sw, start_y+24, start_x+32+sw+16, start_y+40, model.color, model.color, model.color, model.color, false);
draw_sprite_ext(spr_x_8, 0, end_x-32, start_y+32, 2, 2, 0, c_red, 1);
if (mouse_within_rectangle(end_x-32-sprite_get_width(spr_x_8)*2, start_y+32-sprite_get_height(spr_x_8)*2, end_x-32+sprite_get_width(spr_x_8)*2, start_y+32+sprite_get_height(spr_x_8)*2)){
    draw_rectangle(end_x-32-sprite_get_width(spr_x_8)*2, start_y+32-sprite_get_height(spr_x_8)*2, end_x-32+sprite_get_width(spr_x_8)*2, start_y+32+sprite_get_height(spr_x_8)*2, true);
    if (get_release_a()){
        return true;
    }
}
var c1=make_color_rgb(edit_database_model_color_red, 0, 0);
var c2=make_color_rgb(edit_database_model_color_red, 255, 0);
var c3=make_color_rgb(edit_database_model_color_red, 255, 255);
var c4=make_color_rgb(edit_database_model_color_red, 0, 255);
var rect_side=min(end_x-start_x, end_y-start_y-128)-64;
var red_side=32;
draw_rectangle_colour(start_x+32, start_y+64, start_x+32+rect_side, start_y+64+rect_side, c1, c2, c3, c4, false);
draw_rectangle_colour(start_x+32+rect_side+16, start_y+64, start_x+32+rect_side+16+red_side, start_y+64+rect_side, c_black, c_black, c_red, c_red, false);
draw_rectangle(start_x+32, start_y+64, start_x+32+rect_side, start_y+64+rect_side, true);
draw_rectangle(start_x+32+rect_side+16, start_y+64, start_x+32+rect_side+16+red_side, start_y+64+rect_side, true);
draw_line_width_colour(start_x+32+rect_side+16, start_y+64+edit_database_model_color_red*rect_side/255, start_x+32+rect_side+16+red_side, start_y+64+edit_database_model_color_red*rect_side/255, 2, c_white, c_white);
draw_text_ext(start_x+32, start_y+64+rect_side+32, "This won't be visible anywhere except in the editor so it's no big deal really.", -1, (end_x-start_x)-64);
if (mouse_within_rectangle(start_x+32, start_y+64, start_x+32+rect_side, start_y+64+rect_side)){
    if (Controller.a){
        var gg=(MOUSE_X-start_x-32)*255/rect_side;
        var bb=(MOUSE_Y-start_y-64)*255/rect_side;
        model.color=make_color_rgb(edit_database_model_color_red, gg, bb);
    }
} else if (mouse_within_rectangle(start_x+32+rect_side+16, start_y+64, start_x+32+rect_side+16+red_side, start_y+64+rect_side)){
    if (Controller.a){
        edit_database_model_color_red=clamp(255-(start_y+64+rect_side-MOUSE_Y)*255/rect_side, 0, 255);
    }
}

return false;
