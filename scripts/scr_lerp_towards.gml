/// void scr_lerp_towards(ArgSet);
/* Sets the lerp target x, y, z and rate
 * Arguments:
 *   - double x: the X coordinate to lerp towards
 *   - double y: the Y coordinate to lerp towards
 *   - double z: the Z coordinate to lerp towards
 *   - double rate: the rate at which to lerp
 */

actor.lerp_target_x=argument0[| 0].value;
actor.lerp_target_y=argument0[| 1].value;
actor.lerp_target_z=argument0[| 2].value;
actor.lerp_rate=argument0[| 3].value;

World.keep_going=true;
