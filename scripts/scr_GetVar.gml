/// boolean scr_GetVar(ArgSet);
/* Retrieves the value stored in a variable.
 * Arguments:
 *   - float index: the variable index to rtrieve.
 */

catch=argument0;

World.keep_going=true;

return World.vars[eval(argument0[| 0].value)];
