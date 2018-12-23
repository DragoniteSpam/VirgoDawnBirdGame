/// pause_game();

with (World){
    cursor_is_free=true;
    pause_show=true;
    Controller.press_start=false;
    pause_position=Pause.main;
    // Reset all of the pause system variables - find them in World.create
    audio_set_master_gain(0, AUDIO_VOLUME_REDUCED);
    pause_cursor_set(56, 64, pause_main_n);
}

with (Player){
    stats_update_menu();
}
