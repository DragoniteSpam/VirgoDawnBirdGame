/// void scr_show_map(ArgSet);
/* Brings up the map dialogue.
 * syntax (in the const_npc thing):
 *  scr_show_map
 */

var catch=argument0;

pause_game();
with (World){
    pause_position=Pause.map;
    map_nav_position=Misc.map_navigate;
    map_confirm_position=0;
}

World.keep_going=true;
