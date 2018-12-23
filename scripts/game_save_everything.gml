/// void game_save_everything(id);

var buffer=buffer_create(power(2, 10), buffer_grow, 1);
var map=ds_map_create();

/**
 * Begin saving everything
 */

game_save_everything_global(map);
game_save_everything_player(map);
game_save_everything_inventory(map);
game_save_everything_stats(map);

/**
 * End saving everything
 */

buffer_write(buffer, buffer_string, ds_map_write(map));

buffer_save_ext(buffer, SAVE_FILE_DIRECTORY+"\"+string(argument0)+SAVE_FILE_EXTENSION, 0, buffer_tell(buffer));
buffer_delete(buffer);
ds_map_destroy(map);
