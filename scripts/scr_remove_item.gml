/// void scr_remove_item(ArgSet);
/* removes an item from player's inventory
 * Arguments:
 *   - String package: the package of the item to remove
 *   - Item itemIndex: the index of the item to remove
 *   - double quantity: the quantity of the item to remove
 */

var n=eval(argument0[| 2].value);
RemoveItem(argument0[| 0].value, argument0[| 1].value, n);

// this is a copy paste of scr_talk
World.speaking=id;
show_text_t=0;
if (argument0[| 1].value==1){
    show_text_message=get_text(Text.itemRemovedAn)+' '+ds_map_find_value(all_mod_packages, argument0[| 0].value).my_items[argument0[| 1].value].name+'.';
} else {
    show_text_message=get_text(Text.itemRemovedPlural)+' '+string(n)+' '+ds_map_find_value(all_mod_packages, argument0[| 0].value).my_items[argument0[| 1].value].plural+'.';
}
World.speaking_arrow=false;

// @todo Play 'remove item' sound

World.keep_going=false;
