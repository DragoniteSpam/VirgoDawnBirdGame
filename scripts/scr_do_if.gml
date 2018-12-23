/// void scr_teleport(ArgSet);
/* teleports the player to somewhere
 * Arguments:
 *   - boolean condition: if it evaluates true the cutscene will procede, otherwise it will skip
 */

if(eval(string(argument0[| 0].value))==1){

} else {
    var original=cutscene_map[? World.cutscene.cutscene_index].compiled[| World.scene_index-1];
    World.scene_index=original.closed.line_number+1;
}

World.keep_going=true;
