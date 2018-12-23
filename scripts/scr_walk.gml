/// void scr_walk(ArgSet);
/* Causes an NPC (or other Entity) to move around.
 * syntax (in the const_npc thing):
 *  scr_walk, Actor, speed, [direction]
 * Arguments:
 *   - double speed: the speed at which to walk
 *   - {double direction]: the direction to walk in
 */

if (ds_list_size(argument0)>1){
    var d=argument0[| 1];
} else {
    var d=direction;
}

MOVE_WALK(d, argument0[| 0]);

World.keep_going=true;
