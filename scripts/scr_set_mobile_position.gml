/// void scr_set_mobile_position(ArgSet);
/* sets the position along the keyframed path for a mobile translate entity.
 * Arguments:
 *   - float position: the position along the keyframed path to move to
 */

position=clamp(eval(argument0[| 0].value), 0, ds_list_size(stages)-1);

World.keep_going=true;
