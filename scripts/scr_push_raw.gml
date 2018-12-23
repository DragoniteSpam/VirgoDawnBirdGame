/// void scr_push_raw(ArgSet);
/* sets one of the World.variables[n] values without using a script
 * syntax (in the const_npc thing):
 *  scr_push_raw, index, value
 */

World.vars[argument0.a[| 0]]=argument0.a[| 1];

scr_continue();
