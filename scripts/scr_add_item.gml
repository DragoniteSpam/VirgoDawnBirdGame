/// void scr_add_item(ArgSet);
/* gives an item
 * Arguments:
 *   - String package
 *   - Item item
 *   - Double quantity
 */

var n=eval(argument0[| 2].value);
AddItem(argument0[| 0].value, argument0[| 1].value, n);

// this is a copy paste of scr_talk
World.speaking=id;
show_text_t=0;
if (n==1){
    show_text_message=get_text(Text.itemObtainedAn)+' '+ds_map_find_value(all_mod_packages, argument0[| 0].value).my_items[argument0[| 1].value].name+'!';
} else {
    show_text_message=get_text(Text.itemObtainedPlural)+' '+string(n)+' '+ds_map_find_value(all_mod_packages, argument0[| 0].value).my_items[argument0[| 1].value].plural+'!';
}
World.speaking_arrow=false;

// @todo Play 'get item' sound

World.keep_going=false;
