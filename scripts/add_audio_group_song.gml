/// void add_audio_group_song(index, audio0, audio1 .. audion);

with (all_audio_groups[argument[0]]){
    for (var i=1; i<argument_count; i++){
        ds_list_add(songs, argument[i]);
    }
}
