/// void PLAY_AUTO();

with (World) if (Player.location!=noone){
    var ag;
    if (instance_exists(KeyItemRadio)){
        ag=KeyItemRadio.all_stations[| KeyItemRadio.station];
    } else {
        var package=ds_map_find_value(all_mod_packages, Player.location.music_type_package);
        ag=package.my_audio_groups[Player.location.music_type];
        // @todo Find a better way to do this?
    }
    currently_playing=true;
    if (ds_list_size(ag.songs)==0){
        var snd=bgm_woodland_fantasy;
    } else if (ds_list_size(ag.songs)==1){
        var snd=ds_map_find_value(all_mod_packages, ag.packages[| 0]).my_bgm[ag.songs[| 0]].song;
    } else {
        do {
            var index=irandom(array_length_1d(ag.songs)-1);
            var snd=ds_map_find_value(all_mod_packages, ag.packages[| index]).my_bgm[ag.songs[| index]].song;
        } until(current_sound_index!=snd);
    }
    // This will not loop the same song over and over.
    // It will, however, work as intended if there is more than one song per audio group.
    if (current_sound_index!=snd){
        audio_stop_sound(current_sound);
        current_sound_index=snd;
        current_sound=audio_play_sound(current_sound_index, 1, false)
        audio_sound_pitch(current_sound, World.day_time_pitch[day_era]);
        // this is so that it fades in from -1 and appears to not start immediately
        audio_sound_gain(current_sound, 1, SOUND_TRANSITION_TIME*3000);
    }
}
