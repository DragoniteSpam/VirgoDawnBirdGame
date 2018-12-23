/// void scr_set_mobile_action_speed_max(ArgSet);
/* sets the maximum angular speed for a mobile rotation entity
 * Arguments:
 *   - float maxSpeed: the maximum speed at which the entity may rotate
 */

action_speed_max=eval(argument0[| 0].value);

World.keep_going=true;
