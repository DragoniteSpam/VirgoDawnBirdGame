/// void scr_turn_to_face(ArgSet);
/* turns the NPC to face a target.
 * Arguments:
 *   - Entity target: the entity to face
 */

var target=argument0[| 0].value;
direction=point_direction(x, y, target.x, target.y);

World.keep_going=true;
