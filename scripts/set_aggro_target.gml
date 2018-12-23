/// void set_aggro_target(entity id);

aggro_target=argument0;

if (combat_music>0){
    STOP_AUTO();
    current_sound_index=ds_map_find_value(all_mod_packages, combat_music_package).my_bgm[combat_music].song;
    current_sound=PLAY(current_sound_index, true, 1);
    currently_playing=true;
}
