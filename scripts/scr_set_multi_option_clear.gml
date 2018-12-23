/// void scr_set_multi_option_clear(ArgSet);
/* clears the text options for interactive dialogue without
 *  adding anything.
 * Arguments:
 *   (none)
 */

ds_list_clear(show_text_option_list)
ds_list_clear(show_text_option_list_secondary);
ds_list_clear(show_text_option_list_values);
show_text_option_index=0;
show_text_option=true;
World.cursor_is_free=true;

window_mouse_set_ext(W-128-string_width_greatest(show_text_option_list), H*3/4-32-ds_list_size(show_text_option_list)*24);

World.keep_going=true;
