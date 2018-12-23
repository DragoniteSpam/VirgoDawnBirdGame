// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var start_x=32;
var start_y=32;
var h=H-64;
var max_number=38;
draw_clear(c_white);
draw_set_color(graphics_text_color);

draw_rectangle_texture_auto(start_x, start_y, W/4, H-32, true);
draw_text(start_x+16, 48, "Game Text - "+World.lang_code[World.language]);

start_y=start_y+32;
for (var i=edit_text_scroll_index; i<edit_text_scroll_index+max_number; i++){
    if (string_length(game_text[i, 0])>20){
        var a=string_copy(game_text[i, 0], 1, 20)+"...";
    } else {
        var a=game_text[i, 0];
    }
    draw_text(start_x+16, start_y+16+16*(i-edit_text_scroll_index), string(i)+". "+a);
}

if (mouse_within_rectangle(start_x, start_y, W/4-32, H-32)){
    var index=clamp((mouse_y-start_y-16) div 16, 0, max_number-1);
    draw_rectangle(start_x+4, start_y+4+16*index, W/4-32, start_y+16*(index+1)+8, true);
    if (get_release_a()){
        game_text[index+edit_text_scroll_index, 0]=get_string("Label for "+string(index+edit_text_scroll_index)+"?", game_text[index+edit_text_scroll_index, 0]);
    }
    if (mouse_wheel_up()){
        edit_text_scroll_index=max(0, --edit_text_scroll_index);
    } else if (mouse_wheel_down()){
        edit_text_scroll_index=min(array_height_2d(game_text)-1-max_number, ++edit_text_scroll_index);
    } else if (keyboard_check_released(vk_pageup)){
        edit_text_scroll_index=max(0, edit_text_scroll_index-max_number-1);
    } else if (keyboard_check_released(vk_pagedown)){
        edit_text_scroll_index=min(array_height_2d(game_text)-1-max_number, edit_text_scroll_index+max_number-1);
    }
}

start_x=W/4+32;
start_y=32;
draw_rectangle_texture_auto(start_x, start_y, W-32, H-32, true);
draw_text(start_x+16, 48, "Click on a label or the text to edit it.");

start_y=start_y+32;
for (var i=edit_text_scroll_index; i<edit_text_scroll_index+max_number; i++){
    if (string_length(game_text[i, 1])>100){
        var a=string_copy(game_text[i, 1], 1, 100)+"...";
    } else {
        var a=game_text[i, 1];
    }
    draw_text(start_x+16, start_y+16+16*(i-edit_text_scroll_index), a);
}

if (mouse_within_rectangle(start_x, start_y, W-32, H-32)){
    var index=clamp((mouse_y-start_y-16) div 16, 0, max_number-1);
    draw_rectangle(start_x+4, start_y+4+16*index, W-32-4, start_y+16*(index+1)+8, true);
    if (get_release_a()){
        game_text[index+edit_text_scroll_index, 1]=get_string("Text for "+game_text[index+edit_text_scroll_index, 0]+"?", game_text[index+edit_text_scroll_index, 1]);
    }
}
