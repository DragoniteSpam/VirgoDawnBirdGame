var n=array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_audio_groups);
var ag=add_audio("AudioGroup"+string(n+1), "Audio Group "+string(n+1));
(ds_map_find_value(all_mod_packages, edit_database_package)).my_audio_groups[n]=ag;

return ag;
