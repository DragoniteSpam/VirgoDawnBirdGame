/// void editor_save_main_items(package, model, save map, index);

var num=string(argument3);

ds_map_add(argument2, "model_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_summary", argument1.summary);

ds_map_add(argument2, "model_"+argument0+"_"+num+"_archive", argument1.archive);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_path_n", array_length_1d(argument1.path));
for (var i=0; i<array_length_1d(argument1.path); i++){
    ds_map_add(argument2, "model_"+argument0+"_"+num+"_path_"+string(i), argument1.path[i]);
}
ds_map_add(argument2, "model_"+argument0+"_"+num+"_cpath", argument1.cpath);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_model_render_distance", argument1.model_render_distance);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_color", argument1.color);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_selectable", argument1.selectable);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_on_hit", argument1.on_hit);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_format", argument1.format);
ds_map_add(argument2, "model_"+argument0+"_"+num+"_textured", argument1.textured);
