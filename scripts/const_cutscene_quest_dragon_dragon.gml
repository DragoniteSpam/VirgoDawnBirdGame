var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_push_raw, 0, Quests.qDragon));
ds_list_add(l, args(scr_talk, "*dragon noises*", NPCs.NPCDragonDragon));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.not_equal, 400, scr_goto, "end"));

ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Spring, scr_set_multi_option, "Your mates should be in Canada at this time of year.", 100));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Summer, scr_set_multi_option, "Your mates should be in Canada at this time of year.", 100));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Fall, scr_set_multi_option, "Your mates should be in Florida at this time of year.", 100));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Winter, scr_set_multi_option, "Your mates should be in Florida at this time of year.", 100));
ds_list_add(l, args(scr_set_multi_option_more, "Don't know!", 200));

ds_list_add(l, args(scr_talk, "Where should the young dragon head off to?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "*dragon noises*", NPCs.NPCDragonDragon));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 200, scr_goto, "end"));
ds_list_add(l, args(scr_camera_lock_onto_actor, NPCs.NPCDragonDragon));
ds_list_add(l, args(scr_jump, NPCs.NPCDragonDragon));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Spring, scr_goto, "florida"));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Summer, scr_goto, "florida"));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Fall, scr_goto, "canada"));
ds_list_add(l, args(scr_do_if, scr_GetCurrentSeason, Misc.equal, Seasons.Winter, scr_goto, "canada"));

ds_list_add(l, args(scr_keyword, "canada"));
ds_list_add(l, args(scr_turn, NPCs.NPCDragonDragon, 4, 90, true));
ds_list_add(l, args(scr_wait, 2));
ds_list_add(l, args(scr_goto, "converge"));

ds_list_add(l, args(scr_keyword, "florida"));
ds_list_add(l, args(scr_turn, NPCs.NPCDragonDragon, 4, 270, true));
ds_list_add(l, args(scr_wait, 2));
ds_list_add(l, args(scr_goto, "converge"));

ds_list_add(l, args(scr_keyword, "converge"));
ds_list_add(l, args(scr_set_movement_script, NPCs.NPCDragonDragon, movement_fly_forwards));
ds_list_add(l, args(scr_wait, 5));
ds_list_add(l, args(scr_set_movement_script, NPCs.NPCDragonDragon, null));
ds_list_add(l, args(scr_move_to, NPCs.NPCDragonDragon, 0, 0, 0));
ds_list_add(l, args(scr_camera_unlock_onto_actor));
// give the dragon scale here

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));
return l;
