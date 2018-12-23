draw_rectangle_texture_auto(32, 32, W/2, 184, true);
draw_rectangle_texture_auto(W/2+32, 32, W-32, H/2-32, true);
draw_set_color(graphics_text_color);
draw_text(80, 64, get_text(Text.menuInventory));
draw_text(80, 84, get_text(Text.menuTeam));
draw_text(80, 104, get_text(Text.menuMap));
draw_text(80, 124, get_text(Text.menuSettings));
draw_text(80, 144, get_text(Text.menuReturn));
draw_text(80, 164, get_text(Text.menuQuit));

draw_rectangle(72, 54+20*pause_main_n, W/2-8, 76+20*pause_main_n, true);
draw_cursor_auto();

display_cursor=false;

pause_main_n=pause_cursor_handle(32, 32, W/2, 184, pause_main_n, 5);

if (pause_n2!=pause_main_n){
    pause_t=0;
} else {
    pause_update_flavor_text();
}

xx=W/2+80;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

switch (pause_main_n){
    case 0:
        draw_text(xx, 64, get_text(Text.menuInventory));
        var str=get_text(Text.menuInventoryDescription);
        if (ds_list_size(Player.inventory)==0){
            str=str+get_text(Text.menuInventoryDescriptionEmpty);
        }
        draw_text_ext(xx, 104, string_copy(str, 1, pause_t), -1, W/2-160);
        break;
    case 1:
        draw_text(xx, 64, get_text(Text.menuTeam));
        var str=get_text(Text.menuTeamDescription);
        if (ds_list_size(Player.inventory)==0){
            str=str+get_text(Text.menuTeamDescriptionEmpty);
        }
        draw_text_ext(xx, 104, string_copy(str, 1, pause_t), -1, W/2-160);
        break;
    case 2:
        draw_text(xx, 64, get_text(Text.menuMap));
        draw_text_ext(xx, 104, string_copy(get_text(Text.menuMapDescription), 1, pause_t), -1, W/2-160);
        break;
    case 3:
        draw_text(xx, 64, get_text(Text.menuSettings));
        draw_text_ext(xx, 104, string_copy(get_text(Text.menuSettingsDescription), 1, pause_t), -1, W/2-160);
        break;
    case 4:
        draw_text(xx, 64, get_text(Text.menuReturn));
        draw_text_ext(xx, 104, string_copy(get_text(Text.menuReturnDescription), 1, pause_t), -1, W/2-160);
        break;
    case 5:
        draw_text(xx, 64, get_text(Text.menuQuit));
        draw_text_ext(xx, 104, string_copy(get_text(Text.menuQuitDescription), 1, pause_t), -1, W/2-160);
        break;
}

pause_n2=pause_main_n;

if (get_release_a()){
    switch (pause_main_n){
        case 0:
            if (ds_list_size(Player.inventory)>0){
                pause_position=Pause.inventory;
                pause_major_state=Pause.inventory_main;
                pause_major_n=0;
                pause_cursor_set(56, 84, 0);
            }
            break;
        case 1:
            pause_position=Pause.team;
            pause_cursor_set(56, 84, 0);
            break;
        case 2:
            pause_position=Pause.map;
            map_nav_position=Misc.map_navigate;
            map_nav_location=noone;
            pause_cursor_set(256, 256, 0);
            break;
        case 3:
            pause_position=Pause.settings;
            pause_cursor_set(56, 64, 0);
            break;
        case 4:
            unpause_game();
            break;
        case 5:
            pause_position=Pause.quit;
            pause_cursor_set(56, 124, 0);
            break;
    }
}

if (get_release_b()){
    unpause_game();
}
