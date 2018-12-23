var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_set_multi_option_clear));

ds_list_add(l, args(scr_set_multi_option, "Hello!", 0));
ds_list_add(l, args(scr_do_if, scr_GetIsFollowingPlayer, Misc.equal, false, scr_set_multi_option_more, "Follow me for adventure!", 1));
ds_list_add(l, args(scr_do_if, scr_GetIsFollowingPlayer, Misc.equal, true, scr_set_multi_option_more, "Please leave me alone.", 2));

ds_list_add(l, args(scr_push_raw, 0, Quests.qGhost));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 100, scr_set_multi_option_more, "Where's the campgrounds?", 1100));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_set_multi_option_more, "Can you point me towards the floating city?", 1200));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 300, scr_set_multi_option_more, "Know where I can find any camping equipment?", 1300));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 400, scr_set_multi_option_more, "Where's the campgrounds?", 1400));

ds_list_add(l, args(scr_push_raw, 0, Quests.qUFO));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 100, scr_set_multi_option_more, "How do I get to the Ring?", 2100));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_set_multi_option_more, "N/A", 2200)); // this immediately follows the last quest stage so we can ignore it
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 300, scr_set_multi_option_more, "Do you know anything about this code?", 2300));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 400, scr_set_multi_option_more, "How do I get to the Ring?", 2400));

ds_list_add(l, args(scr_talk, "Also, if you have any questions about side quests, feel free to ask me!"));
ds_list_add(l, args(scr_hide_multi_option));

ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_talk, "Okay! If you want me to stop following you, just say the word!"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_follow, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_talk, "Aw man. If you want me to follow you again, just let me know!"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_follow, -1, -1));
// qGhost
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1100, scr_talk, "The campgrounds? Follow the road out of the Aviary south and then hang a right."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1100, scr_talk, "The campgrounds are through the forest and up a hill a little corner of the cliff."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1200, scr_talk, "Floating City. You know the big lake due west of the Aviary? It's about right in the middle."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1200, scr_talk, "Hope you don't mind getting a little wet, because you'll have to wade through some water to get there."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1300, scr_talk, "Camping equipment? I think someone left some in the storage shed, actually."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1300, scr_talk, "It's locked, though. You'll need a key to get in there."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1400, scr_talk, "The campgrounds? Follow the road out of the Aviary south and then hang a right."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1400, scr_talk, "The campgrounds are through the forest and up a hill a little corner of the cliff."));

// qUFO
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2100, scr_talk, "The Ring is the big crater south of the Dragon Pond."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2100, scr_talk, "You know where the Dragon Pond is, right? Right south of the Park, which itself is right south of the Aviary!"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2300, scr_talk, "The code . . . the code . . . I've seen it before . . . hmm . . ."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2300, scr_talk, "Try converting each letter to the letter before it alphabetically. For example, B would become A, and C would become B."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2300, scr_talk, "And then A would wrap around and become Z. Simple enough, right?"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2400, scr_talk, "The Ring is the big crater south of the Dragon Pond."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2400, scr_talk, "You know where the Dragon Pond is, right? Right south of the Park, which itself is right south of the Aviary!"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
