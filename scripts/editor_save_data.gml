var map=ds_map_create();
ds_map_add(map, "teleport", ds_grid_write(teleport_spots));

var file=file_text_open_write(argument0);
file_text_write_string(file, ds_map_write(map));
file_text_close(file);

ds_map_destroy(map);
