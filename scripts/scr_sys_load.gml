/// void scr_sys_load(ArgSet);
/* Loads a saved game.
 * Arguments:
 *   - float index: the index of the file to save
 */

game_load_everything(floor(eval(argument0[| 0].value)));

World.keep_going=true;
