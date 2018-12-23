/// void editor_save_main_recipes(package, recipe, save map, index);

var num=string(argument3);

ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_summary", argument1.summary);

ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_package1", argument1.package[1]);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_package0", argument1.package[0]);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_input1", argument1.input[1]);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_input0", argument1.input[0]);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_output_package", argument1.output_package);
ds_map_add(argument2, "recipe_"+argument0+"_"+num+"_output", argument1.output);
