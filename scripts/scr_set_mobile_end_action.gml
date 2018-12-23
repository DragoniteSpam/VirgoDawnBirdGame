/// void scr_set_mobile_end_action(ArgSet);
/* sets the end action for the mobile translate entity.
 * Arguments:
 *   - MobileEndAction endAction: what to do when the entity hits the end of its path
 */

endaction=argument0[| 0].value;

World.keep_going=true;
