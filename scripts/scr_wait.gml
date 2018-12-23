/// void scr_wait(ArgSet);
/* Causes a cutscene to wait for the specified amount of time.
 * arguments:
 *   - Float time: the number of seconds to wait for
 */

World.timer_wait=eval(argument0[| 0].value)*room_speed;

World.keep_going=false;
