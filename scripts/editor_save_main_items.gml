/// void editor_save_main_items(package, item, save map, index);

var num=string(argument3);

ds_map_add(argument2, "item_"+argument0+"_"+num+"_internal_name", argument1.internal_name);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_name", argument1.name);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_flag", argument1.flag);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_summary", argument1.summary);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_index", argument1.index);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_plural", argument1.plural);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_pocket", argument1.pocket);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_value", argument1.value);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_tmin", argument1.tmin);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_tmax", argument1.tmax);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_item_effect_package", argument1.item_effect_package);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_item_effect", argument1.item_effect);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_item_power", argument1.item_power);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_weapon_graphic", argument1.weapon_graphic);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_weapon_effect", argument1.weapon_effect);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_consume_on_use", argument1.consume_on_use);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_autofire", argument1.autofire);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_weapon_anim_steps", argument1.weapon_anim_steps);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_model_package", argument1.model_package);
ds_map_add(argument2, "item_"+argument0+"_"+num+"_model", argument1.model);
