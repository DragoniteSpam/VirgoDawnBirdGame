draw_rectangle_texture_auto(32, 32, W/2, 196, true);
draw_set_color(graphics_text_color);
draw_set_valign(fa_top)
draw_text_ext(80, 54, string_copy(get_text(Text.menuQuitConfirm), 1, pause_t), -1, W/2-128);

if (pause_t>string_length(get_text(Text.menuQuitConfirm))){
    draw_set_valign(fa_center);
    draw_text(80, 124, get_text(Text.menuQuitToTitle));
    draw_text(80, 144, get_text(Text.menuQuitToWindows));
    draw_text(80, 164, get_text(Text.menuQuitCancel));
    
    draw_rectangle(72, 114+20*pause_major_n, W/2-8, 134+20*pause_major_n, true);
    
    display_cursor=false;
    
    pause_major_n=pause_cursor_handle(32, 32, W/2, 196, pause_major_n, 2, 56, 124);
    
    var go_back=get_release_b();
    
    if (get_release_a()){
        switch (pause_major_n){
            case 0:
                unpause_game();
                mode=GameModes.title;
                break;
            case 1:
                game_end();
                break;
            case 2:
                go_back=true;
                break;
        }
    }

    if (go_back){
        pause_position=Pause.main;
        play_tone_back();
        pause_cursor_set(56, 64, pause_main_n);
    }
}

pause_t+=get_text_speed();

draw_cursor_auto();
