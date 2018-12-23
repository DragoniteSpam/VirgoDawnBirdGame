/// void scr_set_multi_option(ArgSet);
/* adds an option to interactive dialogue
 * Arguments:
 *   - [String text0] The string to add as the first option
 *   - [double id0] The number ID for the first option
 *   - [String textN] The string to add as the nth option
 *   - [double idN] The number ID for the nth option
 */

ds_list_clear(show_text_option_list)
ds_list_clear(show_text_option_list_secondary);
ds_list_clear(show_text_option_list_values);
show_text_option_index=0;
show_text_option=true;
World.cursor_is_free=true;
for (var i=0; i<ds_list_size(argument0); i+=2){
    ds_list_add(show_text_option_list, argument0[| i].value);
    ds_list_add(show_text_option_list_values, argument0[| i+1].value);
}

window_mouse_set_ext(W-128-string_width_greatest(show_text_option_list), H*3/4-32-ds_list_size(show_text_option_list)*24);

World.keep_going=true;
