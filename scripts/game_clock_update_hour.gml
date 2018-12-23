with (World){
    game_current_hour=game_current_hour+argument0;
    audio_sound_pitch(current_sound_index, day_time_pitch[day_era]);
    if (game_current_hour>=24){
        game_clock_update_day(game_current_hour div 24);
        game_current_hour=game_current_hour%24;
    }
}
