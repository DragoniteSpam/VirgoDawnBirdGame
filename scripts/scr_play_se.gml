/// void scr_play_se(ArgSet);
/* Plays a sound effect.
 * Arguments:
 *   - SE effect: the sound effect to play
 */

audio_play_sound(argument0[| 0].value, 1, false);

World.keep_going=true;
