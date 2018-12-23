/// void scr_follow(ArgSet);
/* turns the NPC to face a target.
 * Argumets:
 *   - EntityNPC leader: the leader for the specified NPC to follow
 */

//following=all_npcs[argument0[| 0].value].actor;
following=argument0[| 0].value;
// just in case
movement_is_random=false;

World.keep_going=true;
