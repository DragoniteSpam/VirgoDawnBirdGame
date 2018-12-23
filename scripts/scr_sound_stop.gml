/// void scr_sound_stop(ArgSet);
/* Stops a sound.
 * Arguments:
 *   - Sound soundID: the sound to stop
 *   - double fadeTime: the time to fade out the sound
 */

STOP(argument0[| 0].value, eval(argument0[| 1].value));

World.keep_going=true;
