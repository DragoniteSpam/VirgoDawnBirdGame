/// void scr_string_input_set(ArgSet);
/* gets a string from the user, stores it in Actor.show_text_string
 * Arguments:
 *   - String default: the default text entry string
 *   - double limit: the maximum number of characters that may be entered
 */

// User variables
show_text_string=true;
show_text_string_contents=scr_escape_sequence(argument0[| 0].value);
show_text_string_default=show_text_string_contents;
show_text_string_limit=eval(argument0[| 1].value);
keyboard_string=show_text_string_contents;

World.keep_going=true;
