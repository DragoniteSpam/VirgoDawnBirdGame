/// void scr_fade(ArgSet);
/* fades teh screen
 * Arguments:
 *   - int color: the color to fade to/from
 *   - double value: the value to fade to (typically one or zero)
 *   - double seconds: the duration of the fade
 */

World.fade_color=color_values[argument0[| 0].value];
World.fade_target=eval(argument0[| 1].value);
World.fade_rate=(World.fade_target-World.fade_alpha)/(eval(argument0[| 2].value)*room_speed);

World.keep_going=true;
