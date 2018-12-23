/// void game_load_everything(id);

var buffer=buffer_load(SAVE_FILE_DIRECTORY+"\"+string(argument0)+SAVE_FILE_EXTENSION);
var map=ds_map_create();
ds_map_read(map, buffer_read(buffer, buffer_string));

/**
 * Begin loading everything
 */

game_load_everything_global(map);
game_load_everything_player(map);
game_load_everything_inventory(map);
game_load_everything_stats(map);

/**
 * End loading everything
 */

ds_map_destroy(map);
buffer_delete(buffer);
