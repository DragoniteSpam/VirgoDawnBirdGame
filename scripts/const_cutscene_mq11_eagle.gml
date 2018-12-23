var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "*whistling noises*", NPCs.NPCMQEagle));
ds_list_add(l, args(scr_talk, "It doesn't sound very good . . ."));
ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1100, scr_goto, "q1100"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q1100"));
ds_list_add(l, args(scr_talk, "It's the eagle you were called on to find."));
ds_list_add(l, args(scr_talk, "It looks like it's bleeding . . ."));
ds_list_add(l, args(scr_set_multi_option, "Oh, yes.", 1, "Don't . . . like . . . birds . . .", 2));
ds_list_add(l, args(scr_talk, "Would you like to pick it up and bring it back to the Aviary?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_goto, "end"));
ds_list_add(l, args(scr_talk, "Picked up the eagle."));
ds_list_add(l, args(scr_add_item, Items.MQ01Eagle, 1));
ds_list_add(l, args(scr_move_to, NPCs.NPCMQEagle, 0, 0, 0));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
