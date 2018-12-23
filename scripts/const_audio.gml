enum AudioGroups {
    none,
    cave,
    city,
    cliff,
    forest,
    mountain,
    snow,
    plain,
    sea,
    town,
    wetlands,
    league,
    historical,
    lake,
    victory,
    fire,
    island_dragon,
    sys_title,
    sys_battle_wild,
    sys_battle_end,
    sys_game_over,
    sys_flight,
    sys_surf,
    aviary,
    town_b,
    test,
}

globalvar current_sound, currently_playing, current_sound_index;
current_sound=noone;
currently_playing=false;
current_sound_index=noone;

var array=array_add(AudioGroups.test);

array[AudioGroups.none]=add_audio("None", "None");
array[AudioGroups.cave]=add_audio("Cave", "Cave");
array[AudioGroups.city]=add_audio("City", "City");
array[AudioGroups.cliff]=add_audio("Cliffs", "Cliffs");
array[AudioGroups.forest]=add_audio("Forest", "Forest");
array[AudioGroups.mountain]=add_audio("Mountain", "Mountain");
array[AudioGroups.snow]=add_audio("Snow", "Snow");
array[AudioGroups.plain]=add_audio("Plains", "Plains");
array[AudioGroups.sea]=add_audio("Sea", "Sea");
array[AudioGroups.town]=add_audio("Town", "Town");
array[AudioGroups.wetlands]=add_audio("Wetlands", "Wetlands");
array[AudioGroups.league]=add_audio("League", "League");
array[AudioGroups.historical]=add_audio("Historical", "Historical");
array[AudioGroups.lake]=add_audio("Lake", "Lake");
array[AudioGroups.victory]=add_audio("Victory", "Victory");
array[AudioGroups.fire]=add_audio("Fire", "Fire");
array[AudioGroups.island_dragon]=add_audio("IslandDragon", "Island: Dragon");
array[AudioGroups.sys_title]=add_audio("SystemTitle", "System: Title");
array[AudioGroups.sys_battle_wild]=add_audio("SystemBattleWild", "System: Battle Wild");
array[AudioGroups.sys_battle_end]=add_audio("SystemBattleEnd", "System: Battle End");
array[AudioGroups.sys_game_over]=add_audio("SystemGameOver", "System: Game Over");
array[AudioGroups.sys_flight]=add_audio("Flight", "Flight");
array[AudioGroups.sys_surf]=add_audio("Surfing", "Surfing");
array[AudioGroups.aviary]=add_audio("Aviary", "The Aviary");
array[AudioGroups.town_b]=add_audio("HighTown", "High Town");
array[AudioGroups.test]=add_audio("Test", "Test");

(ds_map_find_value(all_mod_packages, BASE_ASSET)).my_audio_groups=array;

audio_group_load(AGSystem);
audio_group_load(AGEffects);
audio_group_load(AGEnvironmental);
audio_group_load(AGMusic);

globalvar all_audio_info;

settings_reset_audio();

emitter_tick=audio_emitter_create();
emitter_flight_meter=audio_emitter_create();

// we're redefining 'array' here so be careful

array=array_create(3);
array[0]=add_bgm("Silence", "Silence", true, bgm_silence, "", "");
array[1]=add_bgm("WoodlandFantasy", "Woodland Fantasy", true, bgm_woodland_fantasy, "Matthew Pablo", "");
array[2]=add_bgm("BeethovensFifth", "Beethoven's Fifth", true, bgm_beethoven, "Ludwig van Beethoven", "");

(ds_map_find_value(all_mod_packages, BASE_ASSET)).my_bgm=array;

add_bgm_to_audio_group(BASE_ASSET, AudioGroups.forest, BASE_ASSET, 1);  // woodland fantasy
add_bgm_to_audio_group(BASE_ASSET, AudioGroups.aviary, BASE_ASSET, 1);  // woodland fantasy
add_bgm_to_audio_group(BASE_ASSET, AudioGroups.test, BASE_ASSET, 2);    // beethoven's fifth

for (var i=0; i<array_length_1d(ds_map_find_value(all_mod_packages, BASE_ASSET).my_audio_groups); i++){
    var ag=ds_map_find_value(all_mod_packages, BASE_ASSET).my_audio_groups[i];
    if (ds_list_size(ag.songs)==0){
        ds_list_add(ag.packages, BASE_ASSET);
        ds_list_add(ag.songs, 0);
    }
}

enum SE {
    tone,
    final,
}

globalvar all_se;
all_se=array_create(SE.final);

all_se[SE.tone]=add_se("Tone", se_tone, "Plays when you press A and stuff.");
