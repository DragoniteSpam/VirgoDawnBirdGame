/// void scr_sys_save(ArgSet);
/* Saves the game.
 * Arguments:
 *   - float index: the index of the file to save
 */

game_save_everything(floor(eval(argument0[| 0].value)));

World.keep_going=true;
