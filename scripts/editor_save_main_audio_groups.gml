/// void editor_save_main_audio_groups(package, audio group, save map, index);

var num=string(argument3);

ds_map_add(argument2, "ag_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "ag_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "ag_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "ag_"+argument0+"_"+num+"_summary", argument1.summary);

ds_map_add(argument2, "ag_"+argument0+"_"+num+"_packages", ds_list_write(argument1.packages));
ds_map_add(argument2, "ag_"+argument0+"_"+num+"_songs", ds_list_write(argument1.songs));
ds_map_add(argument2, "ag_"+argument0+"_"+num+"_packages_ambient", ds_list_write(argument1.packages_ambient));
ds_map_add(argument2, "ag_"+argument0+"_"+num+"_ambient", ds_list_write(argument1.ambient));
