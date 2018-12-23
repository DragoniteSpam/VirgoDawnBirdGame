/// void scr_unlock_me(ArgSet);
/* Causes an NPC to stop moving.
 * Arguments:
 *   (none)
 */

var catch=argument0;

// this is for the 'boolean flag' lock, not the movement switch
boolean_flags[flag, BF_VALUE]=UNLOCKED;

World.keep_going=true;
