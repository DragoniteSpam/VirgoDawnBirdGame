/// void game_hud_inventory_categories_control(categories);

var s=ds_list_size(argument0);
pause_major_n=pause_cursor_handle(32, 52, W/4, 104+20*s, pause_major_n, s);

var go_back=get_release_b();

if (pause_major_n==s){
    if (get_release_a()){
        go_back=true;
    }
} else {
    if (get_release_a()){
        pause_major_state=Pause.inventory_display;
        pause_cursor_set_inventory(0);
    }
}

if (go_back){
    pause_position=Pause.main;
    play_tone_back();
    pause_cursor_set(56, 64, 0);
}
