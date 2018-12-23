/// void scr_push(ArgSet);
/* sets one of the World.variables[n] values without using a script
 * Arguments:
 *   - int variable: the variable index to store the value in
 *   - any value: the value to store in the variable index
 */

var val;
if (ds_map_exists(World.variables, argument0[| 1].value)){
    val=World.variables[? argument0[| 1].value];
} else {
    val=argument0[| 1].value;
}

World.vars[eval(argument0[| 0].value)]=val;

World.keep_going=true;
