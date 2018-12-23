/// void STOP_AUTO();

if (currently_playing){
    STOP(current_sound, SOUND_TRANSITION_TIME);
    current_sound_index=noone;
    currently_playing=false;
}
