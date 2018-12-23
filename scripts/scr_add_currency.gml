/// boolean scr_add_currency(ArgSet);
/* gives an item
 * syntax (in the const_npc thing):
 *  scr_add_currency, script
 */

AddCurrency(eval(argument0[| 0].value));

World.keep_going=true;
