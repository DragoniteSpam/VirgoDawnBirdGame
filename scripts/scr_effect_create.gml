/// void scr_create_effect(ArgSet);
/* Creates an effect.
 * Arguments:
 *   - EffectObject object: the object you want to create
 *   - double x: the X location of the effect
 *   - double y: the Y location of the effect
 *   - double z: the Z location of the effect
 *   - int variable: the index of the variable you want to store the effect in
 */

var effect=instance_create(argument0[| 1].value, argument0[| 2].value, argument0[| 0].value);
effect.z=argument0[| 3].value;

World.vars[argument0[| 4].value]=effect;

World.keep_going=true;
