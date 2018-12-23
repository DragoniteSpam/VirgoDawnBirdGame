// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var start_x=32;
var h=64;
draw_rectangle_colour(0, 0, W, H, c_white, c_white, c_white, c_white, false);
draw_rectangle_texture_auto(start_x, 32, W/2-32, h, true);
draw_set_color(graphics_text_color);

draw_text(start_x+16, 48, "Quest Control Panel");

var start_y=h+32;
draw_rectangle_texture_auto(start_x, start_y, W/2-32, H-32, true);
for (var i=edit_quest_scroll_index; i<min(edit_quest_scroll_index+18, array_length_1d(all_quests)-1); i++){
    draw_text(start_x+16, start_y+16+32*(i-edit_quest_scroll_index), all_quests[i].name);
}

if (edit_quest_index>=edit_quest_scroll_index&&edit_quest_index<edit_quest_scroll_index+18){
    draw_rectangle(start_x+4, start_y+4+32*(edit_quest_index-edit_quest_scroll_index), W/2-32-16, start_y+32*(edit_quest_index+1-edit_quest_scroll_index)-4, true);
}

if (mouse_within_rectangle(start_x, start_y, W/2-32, H-32)){
    var index=clamp((mouse_y-start_y) div 32, 0, array_length_1d(all_quests));
    draw_rectangle(start_x+4, start_y+4+32*index, W/2-32-16, start_y+32*(index+1)-4, true);
    if (get_release_a()){
        edit_quest_index=index;
    }
    if (mouse_wheel_up()){
        edit_quest_scroll_index=max(0, --edit_quest_scroll_index);
    } else if (mouse_wheel_down()){
        edit_quest_scroll_index=min(array_length_1d(all_quests)-1-18, ++edit_quest_scroll_index);
    } else if (keyboard_check_released(vk_pageup)){
        edit_quest_scroll_index=max(0, edit_quest_scroll_index-18);
    } else if (keyboard_check_released(vk_pagedown)){
        edit_quest_scroll_index=min(array_length_1d(all_quests)-1-18, edit_quest_scroll_index+18);
    }
}

var q=all_quests[edit_quest_index];

start_x=W/2;
start_y=32;

var xx1=64;
var xx2=256;
var xx3=192+192;

draw_rectangle_texture_auto(start_x, start_y, W-32, start_y+96, true);
draw_text(start_x+32, start_y+32, "Quest Log");
draw_text(start_x+xx1, start_y+64, "Uninitiated");
draw_text(start_x+xx2, start_y+64, "Active");
draw_text(start_x+xx3, start_y+64, "Completed");
draw_circle(start_x+xx1-16, start_y+64, 8, true);
draw_circle(start_x+xx2-16, start_y+64, 8, true);
draw_circle(start_x+xx3-16, start_y+64, 8, true);
if (HasCompletedQuest(edit_quest_index)){
    draw_circle(start_x+xx3-16, start_y+64, 8, false);
} else if (HasStartedQuest(edit_quest_index)){
    draw_circle(start_x+xx2-16, start_y+64, 8, false);
} else {
    draw_circle(start_x+xx1-16, start_y+64, 8, false);
}

if (mouse_within_rectangle(start_x, start_y, W-32, start_y+64)){
    if (mouse_within_rectangle(start_x+xx1-24, start_y+56, start_x+xx1-8, start_y+72)){        // uninitiated
        draw_rectangle(start_x+xx1-24, start_y+56, start_x+xx1-8, start_y+72, true);
        if (get_release_a()){
            var aqi=ds_list_find_index(Player.active_quests, q);
            var cqi=ds_list_find_index(Player.completed_quests, q);
            if (aqi>-1){
                ds_list_delete(Player.active_quests, aqi);
            }
            if (cqi>-1){
                ds_list_delete(Player.completed_quests, cqi);
            }
            q.active_stage=0;
        }
    } else if (mouse_within_rectangle(start_x+xx2-24, start_y+56, start_x+xx2-8, start_y+72)){ // active
        draw_rectangle(start_x+xx2-24, start_y+56, start_x+xx2-8, start_y+72, true);
        if (get_release_a()){
            var cqi=ds_list_find_index(Player.completed_quests, q);
            if (cqi>-1){
                ds_list_delete(Player.completed_quests, cqi);
            }
            ds_list_add(Player.active_quests, q);
            q.active_stage=max(q.active_stage, 1);
        }
    } else if (mouse_within_rectangle(start_x+xx3-24, start_y+56, start_x+xx3-8, start_y+72)){ // completed
        draw_rectangle(start_x+xx3-24, start_y+56, start_x+xx3-8, start_y+72, true);
        if (get_release_a()){
            var aqi=ds_list_find_index(Player.active_quests, q);
            if (aqi>-1){
                ds_list_delete(Player.active_quests, aqi);
            }
            ds_list_add(Player.completed_quests, q);
            q.active_stage=ds_list_size(q.stages);
        }
    }
}

start_y=160;

draw_rectangle_texture_auto(start_x, start_y, W-32, H-32, true);

draw_text(start_x+64, start_y+16, "<Off> [0]");
draw_sprite(spr_checkbox_16, 1, start_x+32+8, start_y+8+16);

for (var i=1; i<=ds_list_size(q.stages); i++){
    draw_text(start_x+64, start_y+16+32*i, q.stages[| i-1].name+" ["+string(q.stages[| i-1].stage_id)+"]");
    draw_sprite(spr_checkbox_16, (q.active_stage>=i)+2*(q.active_stage==i-1), start_x+32+8, start_y+32*i+8+16);
}

if (mouse_within_rectangle(start_x, start_y, W-32, H-32)){
    var index=clamp((mouse_y-start_y) div 32, 0, ds_list_size(q.stages));
    draw_rectangle(start_x+4, start_y+4+32*index, W-32-16, start_y+32*(index+1)-4, true);
    if (get_release_a()){
        q.active_stage=max(0, index-1);
        if (index==0){
            var aqi=ds_list_find_index(Player.active_quests, q);
            var cqi=ds_list_find_index(Player.completed_quests, q);
            if (aqi>-1){
                ds_list_delete(Player.active_quests, aqi);
            }
            if (cqi>-1){
                ds_list_delete(Player.completed_quests, cqi);
            }
        } else if (index<ds_list_size(q.stages)){
            var cqi=ds_list_find_index(Player.completed_quests, q);
            if (cqi>-1){
                ds_list_delete(Player.completed_quests, cqi);
            }
            ds_list_add(Player.active_quests, q);
        } else {
            var aqi=ds_list_find_index(Player.active_quests, q);
            if (aqi>-1){
                ds_list_delete(Player.active_quests, aqi);
            }
            ds_list_add(Player.completed_quests, q);
        }
    }
}
