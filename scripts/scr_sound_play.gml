/// void scr_sound_play(ArgSet);
/* Plays some sound.
 * Arguments:
 *   - Sound soundID: the sound to play
 *   - boolean looping: true if the sound is to loop, false otherwise
 *   - [double fadeTime]: the time for the sound to fade in over
 */

if (ds_list_size(argument0)>2){
    var t=eval(argument0[| 2].value);
} else {
    t=0;
}

PLAY(argument0[| 0].value, argument0[| 1].value, t);

World.keep_going=true;
