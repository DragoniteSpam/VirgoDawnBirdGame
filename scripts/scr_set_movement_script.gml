/// void scr_set_movement_script(ArgSet);
/* turns the NPC to face a target.
 * Arguments:
 *   - MovementScript script: The movement script to assign to the calling Actor
 */

movement_script=argument0[| 0].value;

World.keep_going=true;
