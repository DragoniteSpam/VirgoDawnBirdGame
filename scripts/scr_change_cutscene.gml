/// void scr_change_cutscene(ArgSet);
/* changes the actor to something else, like when you want someone's
 * dialogue/actions to change.
 * syntax (in the const_npc thing):
 *  scr_change_actor, new actor index
 */

cutscene_index=argument0.a[| 0];

// No continue here because changing the actor index would cause the
// cutscene to jump to a stage in the scene script it just got changed into.
// ONLY call this at the end, even after the lock_unset line.
