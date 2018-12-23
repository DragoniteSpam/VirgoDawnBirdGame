var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Chirp . . . chirp . . ."));
ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 600, scr_goto, "q600"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 900, scr_goto, "q900"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q600"));
ds_list_add(l, args(scr_talk, "It looks like this is the injured blue jay that you were told to find."));
ds_list_add(l, args(scr_set_multi_option, "Yeah, let's do that.", 1, "Nope. Not touching a bird.", 2));
ds_list_add(l, args(scr_talk, "Would you like to pick it up and bring it back to the Aviary?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_goto, "end"));
ds_list_add(l, args(scr_talk, "Picked up the blue jay."));
ds_list_add(l, args(scr_add_item, Items.MQ01BlueJay, 1));
ds_list_add(l, args(scr_move_to, NPCs.NPCMQBlueJay, 0, 0, 0));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q900"));
ds_list_add(l, args(scr_set_multi_option, "Time for adventure!", 1, "Nope. Not touching a bird.", 2));
ds_list_add(l, args(scr_talk, "It's the blue jay you found earlier. Would you like it to join your team?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_goto, "end"));
ds_list_add(l, args(scr_talk, "Picked up the blue jay."));
ds_list_add(l, args(scr_move_to, NPCs.NPCMQBlueJay, 0, 0, 0));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
