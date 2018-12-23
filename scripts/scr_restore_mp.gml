/// void scr_restore_mp(ArgSet);
/* Restores a specific amount of MP to an Entity.
 * Arguments:
 *   - float amount: how much MP to restore.
 */

mp_current=clamp(mp_current+eval(argument0[| 0].value), 0, get_max_hp(exp_mp));

World.keep_going=true;
