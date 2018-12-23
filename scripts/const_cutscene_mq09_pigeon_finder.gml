var l=ds_list_create();

ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 900, scr_talk, "There's a pigeon on the roof. It's been up there for a while. Wonder what happened to it."));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.not_equal, 900, scr_talk, "I like hanging out at this diner, but there's never any food on any of the tables. Have you noticed?"));
ds_list_add(l, args(scr_lock_unset));

return l;
