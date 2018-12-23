/// void editor_save_main_maps(package, map, save map, index);

var num=string(argument3);

ds_map_add(argument2, "map_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "map_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "map_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "map_"+argument0+"_"+num+"_summary", argument1.summary);

//ds_map_add(argument2, "map_"+argument0+"_"+num+"_respawns", argument1.respawns);
