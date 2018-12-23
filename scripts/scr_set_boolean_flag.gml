/// void scr_set_boolean_flag(ArgSet);
/* sets one of the boolean flag values
 * Arguments:
 *   - double flagID: the ID of the flag to set the value of
 *   - boolean value: true or false
 */


boolean_flags[argument0[| 0].value, 0]=argument0[| 1].value;

World.keep_going=true;
