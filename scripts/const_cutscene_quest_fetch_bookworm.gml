var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, Quests.qFetch));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 400, scr_set_multi_option, "Do you have a book on chickens?", 100));
ds_list_add(l, args(scr_talk, "It's my goal to read every book in the library before I die."));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.not_equal, 100, scr_goto, "end"));

ds_list_add(l, args(scr_set_multi_option, "Can I have it? I need it.", 100));
ds_list_add(l, args(scr_talk, "A book on chickens? I just finished reading it. Why do you ask?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_set_multi_option, "It's complicated.", 100));
ds_list_add(l, args(scr_talk, "I, er, I suppose so. What's the hurry?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "Well, I already finished reading it, so it's not doing me any good. Here, enjoy."));
ds_list_add(l, args(scr_add_item, Items.BCHICKENS, 1));
ds_list_add(l, args(scr_validate_quests));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
