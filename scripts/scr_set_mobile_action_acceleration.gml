/// void scr_set_mobile_action_acceleration(ArgSet);
/* sets the angular acceleration for a mobile rotation entity
 * Arguments:
 *   - float acceleration: the rate at which the rotation speed ought to increase (rotations/(second*second))
 */

action_acceleration=eval(argument0[| 0].value);

World.keep_going=true;
