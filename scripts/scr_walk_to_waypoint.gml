/// void scr_walk_to_waypoint(ArgSet);
/* Causes an NPC (or other Entity) to move around.
 * Arguments:
 *   - Package package: the package that the target NPC lives in
 *   - Entity target: the target (waypoint) to walk to
 *   - float speed: the speed at which to walk to the target
 */

var target=ds_map_find_value(all_mod_packages, argument0[| 1].value).my_npcs[argument0[| 1].value].actor;

var d=point_direction(x, y, target.x, target.y);

MOVE_WALK(d, eval(argument0[| 2].value));
move_target=target;

World.keep_going=true;
