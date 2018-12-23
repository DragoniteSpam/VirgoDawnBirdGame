var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, Quests.test));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, false, scr_goto, "StartQuest"));
ds_list_add(l, args(scr_do_if, scr_GetHasCompletedQuest, Misc.equal, true, scr_goto, "CompletedQuest"));
ds_list_add(l, args(scr_talk, "Please find my stuff!"));
ds_list_add(l, args(scr_goto, "End"));

ds_list_add(l, args(scr_keyword, "CompletedQuest"));
ds_list_add(l, args(scr_talk, "Hey, thanks!"));
ds_list_add(l, args(scr_goto, "End"));

ds_list_add(l, args(scr_keyword, "StartQuest"));
ds_list_add(l, args(scr_talk, "I lost my Lawn Mower. Can you find it for me?"));
ds_list_add(l, args(scr_quest_begin, Quests.test));
ds_list_add(l, args(scr_goto, "End"));

ds_list_add(l, args(scr_keyword, "End"));
ds_list_add(l, args(scr_lock_unset));

return l;
