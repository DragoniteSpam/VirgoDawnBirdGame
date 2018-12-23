var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Coo . . . coo . . .", NPCs.NPCMQPigeon));
ds_list_add(l, args(scr_talk, "Its cry is weak . . ."));
ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 900, scr_goto, "q900"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q900"));
ds_list_add(l, args(scr_talk, "It's the pigeon on the roof. Wonder how it got here."));
ds_list_add(l, args(scr_set_multi_option, "I guess we'd better.", 1, "I don't like touching birds.", 2));
ds_list_add(l, args(scr_talk, "Would you like to pick it up and bring it back to the Aviary?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_goto, "end"));
ds_list_add(l, args(scr_talk, "Picked up the pigeon."));
ds_list_add(l, args(scr_add_item, Items.MQ01Pigeon, 1));
ds_list_add(l, args(scr_move_to, NPCs.NPCMQPigeon, 0, 0, 0));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
