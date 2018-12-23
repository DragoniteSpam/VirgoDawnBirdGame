/// save_door(file);

save_entity(argument0);

ds_map_add(argument0, "lit", lit);
ds_map_add(argument0, "scale", scale);
ds_map_add(argument0, "density", density);

ds_map_add(argument0, "olx", offset_light_x);
ds_map_add(argument0, "oly", offset_light_y);
ds_map_add(argument0, "olz", offset_light_z);

ds_map_add(argument0, "range_default", range_default);
ds_map_add(argument0, "range_flicker", range_flicker);
