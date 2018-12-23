/// void scr_bowl_fill_water(ArgSet);
/* Causes an NPC to stop moving.
 * syntax (in the const_npc thing):
 *  scr_bowl_fill_water
 */

var catch=argument0;

state=Misc.water;

scr_continue();
