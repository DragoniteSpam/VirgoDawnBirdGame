/// void scr_set_multi_option_more(ArgSet);
/* adds an option to interactive dialogue (in case you can't fit
 *  all of the ones that you want within the argument limit)
 * Arguments:
 *   - [String text0] The string to add as the first option
 *   - [double id0] The number ID for the first option
 *   - [String textN] The string to add as the nth option
 *   - [double idN] The number ID for the nth option
 */

for (var i=0; i<ds_list_size(argument0); i+=2){
    ds_list_add(show_text_option_list, argument0[| i].value);
    ds_list_add(show_text_option_list_values, argument0[| i+1].value);
}

World.keep_going=true;
