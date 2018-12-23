/// void editor_save_main_bgm(package, bgm, save map, index);

var num=string(argument3);

ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_summary", argument1.summary);

ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_internal_song", argument1.internal_song);
ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_song", ternary(argument1.internal_song, audio_get_name(argument1.song), ''));
ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_path", argument1.path);
ds_map_add(argument2, "bgm_"+argument0+"_"+num+"_author", argument1.author);
