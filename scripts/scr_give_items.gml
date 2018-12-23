/// void scr_give_items(ArgSet);
/* gives the items contained in the entity
 * Arguments:
 *   - (none)
 */

// THIS IS FOR TREASURE CHESTS! Don't delete it!

var catch=argument0;

AddItem(loot_package, loot, loot_quantity);

World.keep_going=true;
