/// void editor_hud_database_resource_select(resource, text, list populator, display name script, result script);

start_x=W/4+128;
start_y=128;
end_x=W*3/4-128;
end_y=H-128;
edit_database_filter=edit_database_filter+keyboard_string;
keyboard_string="";
if (keyboard_check_pressed(vk_backspace)){
    edit_database_filter=string_backspace(edit_database_filter);
}
draw_rectangle_texture_auto(start_x, start_y, end_x, end_y, true);
draw_text(start_x+32, start_y+32, argument1+edit_database_filter+ternary(current_second%2==0, "|", ""));
draw_sprite_ext(spr_x_8, 0, end_x-32, start_y+32, 2, 2, 0, c_red, 1);
if (mouse_within_rectangle(end_x-32-sprite_get_width(spr_x_8)*2, start_y+32-sprite_get_height(spr_x_8)*2, end_x-32+sprite_get_width(spr_x_8)*2, start_y+32+sprite_get_height(spr_x_8)*2)){
    draw_rectangle(end_x-32-sprite_get_width(spr_x_8)*2, start_y+32-sprite_get_height(spr_x_8)*2, end_x-32+sprite_get_width(spr_x_8)*2, start_y+32+sprite_get_height(spr_x_8)*2, true);
    if (get_release_a()){
        return true;
    }
}

var number_entries=(end_y-start_y-96) div 16;
ds_list_clear(edit_database_filter_list);
script_execute(argument2, argument0);

if (ds_list_size(edit_database_filter_list)==0){
    draw_text_colour(start_x+32, start_y+64, "No results.", c_gray, c_gray, c_gray, c_gray, 1);
} else {
    for (var i=edit_database_filter_start; i<min(ds_list_size(edit_database_filter_list), edit_database_filter_start+number_entries); i++){
        draw_text(start_x+32, start_y+64+(i-edit_database_filter_start)*16, script_execute(argument3, i));
    }
}
var max_entry=max(0, ds_list_size(edit_database_filter_list)-1);
if (mouse_within_rectangle(start_x, start_y+40, end_x, end_y)){
    var n=clamp((MOUSE_Y-start_y-56) div 16, 0, min(ds_list_size(edit_database_filter_list)-1, number_entries));
    draw_rectangle(start_x+16, start_y+56+16*n, end_x-16, start_y+72+16*n, true);
    if (get_release_a()&&(n+edit_database_filter_start)<ds_list_size(edit_database_filter_list)){
        script_execute(argument4, argument0, n+edit_database_filter_start);
        return true;
    }
    if (mouse_wheel_up()){
        edit_database_filter_start=max(0, --edit_database_filter_start);
    } else if (mouse_wheel_down()){
        edit_database_filter_start=min(max_entry, ++edit_database_filter_start);
    }
}

edit_database_filter_start=min(max_entry, edit_database_filter_start);

return false;
