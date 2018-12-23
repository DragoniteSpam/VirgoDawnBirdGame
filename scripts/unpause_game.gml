/// void unpause_game();

with (World){
    cursor_is_free=false;
    pause_show=false;
    graphics_show_color_picker=-1;
    centerCursor();
    audio_set_master_gain(0, 1);
}
