#define hud_book_journal
mouse_over_menu=true;
display_cursor=false;
var go_back=get_release_b();

var yy=HH/2-275;

draw_set_color(c_black);
if (journal_mode==Misc.journal_quests_title||journal_mode==Misc.journal_quests_back){
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(Font32);
    if (journal_mode==Misc.journal_quests_title){
        draw_background_ext(b_book_newsprint, W/2-213, yy, 2, 2, 0, c_white, 1);
        draw_text(W/2, yy+64, "Quest Journal");
    } else if (journal_mode==Misc.journal_quests_back){
        draw_background_ext(b_book_newsprint, W/2+213, yy, -2, 2, 0, c_white, 1);
    }
} else {
    var xx=W/2-425;
    draw_background_ext(b_book_newsprint, W/2, yy, -2, 2, 0, c_white, 1);
    draw_background_ext(b_book_newsprint, W/2, yy, 2, 2, 0, c_white, 1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(Font16);
    xx=xx+32;
    yy=yy+32;
    draw_line(xx, yy+32, W/2-32, yy+32);
    draw_line(W/2+32, yy+32, W/2+425-32, yy+32);
    // @todo Proper scrolling on the list
    if (journal_mode==Misc.journal_quests_active){
        hud_book_journal_process(Player.active_quests, "Active Quests", "You haven't completed any quests yet. Talk to some people to get started!");
    } else if (journal_mode==Misc.journal_quests_complete){
        hud_book_journal_process(Player.completed_quests, "Completed Quests", "You haven't completed any quests yet. Perhaps you should get on that!");
    }
}

if (Controller.press_left){
    if (journal_mode==Misc.journal_quests_title){
        journal_mode=Misc.journal_quests_back;
    } else if (journal_mode==Misc.journal_quests_active){
        journal_mode=Misc.journal_quests_title;
    } else if (journal_mode==Misc.journal_quests_complete){
        journal_mode=Misc.journal_quests_active;
    } else if (journal_mode==Misc.journal_quests_back){
        journal_mode=Misc.journal_quests_complete;
    }
} else if (Controller.press_right){
    if (journal_mode==Misc.journal_quests_title){
        journal_mode=Misc.journal_quests_active;
    } else if (journal_mode==Misc.journal_quests_active){
        journal_mode=Misc.journal_quests_complete;
    } else if (journal_mode==Misc.journal_quests_complete){
        journal_mode=Misc.journal_quests_back;
    } else if (journal_mode==Misc.journal_quests_back){
        journal_mode=Misc.journal_quests_title;
    }
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}

#define hud_book_journal_process
/// void hud_book_journal_process(list, header null, null message);

var s=ds_list_size(argument0);
var yy=HH/2-275+32;
var xx=W/2-425+32;

for (var i=bottom; i<s; i++){
    var q=argument0[| i];
    World.vars[0]=i;
    var c=ternary(q.active&&!scr_GetHasCompletedQuest(null), c_blue, c_black);
    draw_text_colour(xx+32, yy+52+20*i, q.name, c, c, c, c, 1);
}

// @todo Make the quests scroll if there are enough of them
// @todo Align the crosshair properly

draw_set_color(c_black);
if (s>0){
    draw_text(xx, yy, argument1);
    quest_index=pause_cursor_handle(xx-12, yy+44-background_get_height(World.crosshair_array[crosshair_index])/2, W/2, yy-64+2*background_get_height(b_book_newsprint), quest_index, min(QUEST_JOURNAL_LIMIT, s)-1);
    var q=argument0[| quest_index];
    World.vars[0]=quest_index;
    var completed=scr_GetHasCompletedQuest(null);
    if (!completed&&get_release_y()){
        q.active=!q.active;
    }
    draw_text_ext(W/2+32, yy+52, q.description+'#'+q.stages[| q.active_stage].description, -1, (W/2-xx-32));
    draw_line(W/2+32, H/2, W/2+425-32, H/2);
    for (var i=0; i<=q.active_stage; i++){
        var c=ternary(i==q.active_stage, c_green, c_black);
        draw_text_colour(W/2+32, H/2+20+20*i, q.stages[| i].name, c, c, c, c, 1)
    }
    if (!completed){
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        if (q.active){
            draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, "Deactivate");
        } else {
            draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, "Activate");
        }
    }
} else {
    draw_text_ext(xx+32, yy+52, argument2, -1, (W/2-64-xx));
}