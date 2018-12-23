var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Hi! Welcome to the library!"));
ds_list_add(l, args(scr_push_raw, 0, Quests.qFetch));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 300, scr_set_multi_option, "Do you have any books about chickens?", 100));
ds_list_add(l, args(scr_push_raw, 0, Quests.qDragon));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_set_multi_option, "Do you have any books about dragons?", 200));
ds_list_add(l, args(scr_set_multi_option_more, "Just sayin' hello!", 0));
ds_list_add(l, args(scr_talk, "If you have any questions, feel free to ask!"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 100, scr_goto, "qFetch"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 200, scr_goto, "qDragon"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "qFetch"));
ds_list_add(l, args(scr_talk, "Books about chickens?"));
ds_list_add(l, args(scr_do_if, scr_GetIsMorning, Misc.equal, true, scr_talk, "Unfortunately, we just sold the last copy we have this morning."));
ds_list_add(l, args(scr_do_if, scr_GetIsMorning, Misc.equal, false, scr_talk, "Unfortunately, we just sold the last copy we have last night."));
ds_list_add(l, args(scr_talk, "The young lady who took it said she wanted some reading material for a relaxing day in the park. If it's urgent and you ask nicely perhaps she'll lend it to you."));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "qDragon"));
ds_list_add(l, args(scr_talk, "Books about dragons?"));
ds_list_add(l, args(scr_set_multi_option, "Sure!", 0));
ds_list_add(l, args(scr_talk, "We do have one. It's called "+'"Dragons of North America."'+" Would you like a copy?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "Here you go! Keep it in good condition, please!"));
ds_list_add(l, args(scr_add_item, Items.BDRAGONS, 1));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
