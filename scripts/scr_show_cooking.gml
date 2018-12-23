/// void scr_show_cooking(ArgSet);
/* Brings up the cooking dialogue.
 * Arguments:
 *   (none)
 */

var catch=argument0;

pause_game();

with (World){
    pause_position=Pause.cooking;
    cooking_position=0;
    cooking_list_index=0;
    cooking_list_offset=0;
    cooking_show_list=false;
    cooking_input[1]=Items.NONE;
    cooking_input[0]=Items.NONE;
}

World.keep_going=true;
