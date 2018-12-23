/// void scr_effect_set_target_alpha(ArgSet);
/* Sets the target alpha of an effect stored in a variable index.
 * Arguments:
 *   - int variable: the variable index of the effect to set the alpha of
 *   - double targetAlpha: the target alpha
 */

World.vars[argument0[| 0].value].target_alpha=argument0[| 1].value;

World.keep_going=true;
