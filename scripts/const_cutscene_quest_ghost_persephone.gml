/// cutscene const_cutscene_STUB_quest(quest);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, Quests.qGhost));

ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_set_multi_option, "Your friend is looking for you.", 0));
ds_list_add(l, args(scr_talk, "It's windier up on the top of the town than it is at the bottom, have you noticed?"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_goto, "q200"));  // good
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 300, scr_goto, "q300"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q200"));
ds_list_add(l, args(scr_set_multi_option, "The one you were supposed to go camping with.", 0));
ds_list_add(l, args(scr_talk, "My friend? I'm afriad I don't understand."));
ds_list_add(l, args(scr_set_multi_option, "She's the ghost who's haunting the campground.", 0));
ds_list_add(l, args(scr_talk, "But that was YEARS ago . . . wow. How did you find this out?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "Huh . . . well, I'd love to go, but unfortunately I ditched all of my camping stuff ages ago."));
ds_list_add(l, args(scr_talk, "I need a tent, a sleeping bag and <clearly dragonite never goes outside so he wouldn't know what else you need>."));
ds_list_add(l, args(scr_set_multi_option, "Sure.", 0, "I have no choice, do I?", 1));
ds_list_add(l, args(scr_talk, "Would you mind finding some for me?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "Thanks! I'll be right here!"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q300"));
ds_list_add(l, args(scr_talk, "Do you have the stuff?"));
ds_list_add(l, args(scr_push_raw, 0, Items.CAMPINGSTUFF));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, true, scr_goto, "q400"));
ds_list_add(l, args(scr_talk, "Please find me some camping stuff."));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q400"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_talk, "You have it! Thanks!"))
ds_list_add(l, args(scr_remove_item, Items.CAMPINGSTUFF, 1));
ds_list_add(l, args(scr_talk, "I'm off to the campgrounds now. Take care!"))
ds_list_add(l, args(scr_fade, c_black, 1, 2));
ds_list_add(l, args(scr_wait, 2));
ds_list_add(l, args(scr_move_to, NPCs.NPCGhostFriend, 15000, 15258, 116));
ds_list_add(l, args(scr_move_to, NPCs.NPCGhostTent, 15150, 15340, 116));
ds_list_add(l, args(scr_light, NPCs.NPCGhostFire, true));
ds_list_add(l, args(scr_fade, c_black, 0, 2));
ds_list_add(l, args(scr_wait, 2));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
