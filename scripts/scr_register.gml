/// void scr_register(ArgSet);
/* Stores an NPC's instance ID for future reference.
 * This may not work anymore.
 * Arguments:
 *   - Package package: the package that the NPC you're registering to lives in
 *   - NPC id: the ID of the NPC to register the calling actor to
 */

(ds_map_find_value(all_mod_packages, argument0[| 0].value)).my_npcs[argument0[| 1].value].actor=id;

World.keep_going=true;
