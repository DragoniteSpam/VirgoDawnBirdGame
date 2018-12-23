/// void scr_effect_destroy(ArgSet);
/* Destroys an effect stored in a variable index.
 * Arguments:
 *   - int variable: the variable index of the effect you want to destroy
 */

with (World.vars[argument0[| 0].value]){
    instance_destroy();
}

World.keep_going=true;
