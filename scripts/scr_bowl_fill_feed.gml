/// void scr_bowl_fill_feed(ArgSet);
/* Causes an NPC to stop moving.
 * syntax (in the const_npc thing):
 *  scr_bowl_fill_feed
 */

var catch=argument0;

state=Misc.feed;

scr_continue();
