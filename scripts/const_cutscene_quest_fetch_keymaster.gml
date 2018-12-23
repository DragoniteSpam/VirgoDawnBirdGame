var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Hello, there. I'm the keymaster!"));
ds_list_add(l, args(scr_push_raw, 0, Quests.qFetch));
ds_list_add(l, args(scr_set_multi_option, "Just saying hello!", 0));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 100, scr_set_multi_option_more, "Do you have the key to the storage barn?", 100));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 600, scr_set_multi_option_more, "I found the key to the storage barn.", 600));
ds_list_add(l, args(scr_talk, "I'm in charge of making sure everyone can get into the buildings around here!"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 100, scr_goto, "qf100"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 600, scr_goto, "qf600"));
ds_list_add(l, args(scr_talk, "Have a good one!"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "qf100"));
ds_list_add(l, args(scr_talk, "The Storage Barn? I think I do, hang on."));
ds_list_add(l, args(scr_talk, ". . ."));
ds_list_add(l, args(scr_talk, "That's funny, I can't seem to find it."));
ds_list_add(l, args(scr_talk, "The last place I know I had it was in the park. Maybe you should check around there?"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "qf600"));
ds_list_add(l, args(scr_talk, "You did? Excellent!"));
ds_list_add(l, args(scr_talk, "I don't need it urgently right now, so you can hang on to it."));
ds_list_add(l, args(scr_talk, "Just don't break anything in there!"));
//ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
