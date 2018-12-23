/// void scr_set_mobile_action_speed(ArgSet);
/* sets the action speed for a mobile translate entity.
 * Arguments:
 *   - float actionSpeed: the number of keyframes per second to visit
 */

action_speed=eval(argument0[| 0].value);

World.keep_going=true;
