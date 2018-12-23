/// void editor_save_main_pressure_plate_actions(package, ppa, save map, index);

var num=string(argument3);

ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_summary", argument1.summary);

ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_on_trigger_package", argument1.on_trigger_package);
ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_on_trigger", argument1.on_trigger);
ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_on_release_package", argument1.on_release_package);
ds_map_add(argument2, "ppa_"+argument0+"_"+num+"_on_release", argument1.on_release);
