/// void scr_play_se_pickup(ArgSet);
/* Plays a sound effect for a pickup.
 * Arguments:
 *   - (none)
 */

var catch=argument0;

audio_play_sound(choose(se_feather_0, se_feather_1, se_feather_2,
    se_feather_3, se_feather_4, se_feather_5, se_feather_6), 1, false);

World.keep_going=true;
