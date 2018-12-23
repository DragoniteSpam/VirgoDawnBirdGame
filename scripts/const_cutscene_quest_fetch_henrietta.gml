var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "You know what are awesome?"));
ds_list_add(l, args(scr_push_raw, 0, Quests.qFetch));
ds_list_add(l, args(scr_set_multi_option, "They are!", 0));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_set_multi_option_more, "Have you seen any keys lying around?", 100));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 500, scr_set_multi_option_more, "I have your book about chickens.", 200));
ds_list_add(l, args(scr_talk, "Chickens are awesome, that's what!"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 100, scr_goto, "qf100"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 200, scr_goto, "qf200"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "qf100"));
ds_list_add(l, args(scr_set_multi_option, "Can I have it? I need it.", 100));
ds_list_add(l, args(scr_talk, "As a matter of fact, I have!"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "Huh, you need it? Well, I'm not going to give it to you THAT easily."));
ds_list_add(l, args(scr_talk, "Let's make a deal. I'm looking for a book about chickens. If you can bring me that book, I'll give you the key."));
ds_list_add(l, args(scr_set_multi_option, "I have no chocie, do I?", 100, "No, no it doesn't. At all.", 200));
ds_list_add(l, args(scr_talk, "Sound good?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "Hey, supply and demand. I have the supply, so you'll have to meet my demands."));
ds_list_add(l, args(scr_talk, "Good luck finding a book on chickens!"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "qf200"));
ds_list_add(l, args(scr_talk, "Cool! Can I have it?"));
ds_list_add(l, args(scr_talk, "*Gave the book on chickens to Henrietta.*"));
ds_list_add(l, args(scr_remove_item, Items.BCHICKENS, 1));
ds_list_add(l, args(scr_talk, "Awesome! Thanks!"));
ds_list_add(l, args(scr_talk, "Here's your key. It's not like I really needed it, I just wanted a book about chickens."));
ds_list_add(l, args(scr_add_item, Items.KSTORAGEBARN, 1));
//ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
