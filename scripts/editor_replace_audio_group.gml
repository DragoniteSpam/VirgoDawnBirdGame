// Replaces the "audio groups" array. Workaround for the fact that you can't just remove
// values from arrays in Game Maker.

(ds_map_find_value(all_mod_packages, edit_database_package)).my_audio_groups=argument0;
