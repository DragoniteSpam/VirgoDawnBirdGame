/// cutscene const_cutscene_STUB_quest(quest);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, Quests.qGhost));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 100, scr_goto, "q100"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_goto, "q200"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 300, scr_goto, "q200"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 400, scr_goto, "q400"));
ds_list_add(l, args(scr_talk, ". . ."));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q100"));
ds_list_add(l, args(scr_set_multi_option, "Haunting this place, are we?", 0));
ds_list_add(l, args(scr_talk, "What do you want?"));

ds_list_add(l, args(scr_set_multi_option, "For what?", 0));
ds_list_add(l, args(scr_talk, "Nope. Just waiting."));

ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "My friend and I were supposed to go camping here on this site, but I died before we did that."));
ds_list_add(l, args(scr_set_multi_option, "Does your friend know this?", 0));
ds_list_add(l, args(scr_talk, "I decided to go anyway. Now I'm just waiting for her to show up."));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "I have no idea. Actually, would you mind going and reminding her? She lives on the upper level of the floating town."));
ds_list_add(l, args(scr_goto, "end"));

// stage 300 also directs here
ds_list_add(l, args(scr_keyword, "q200"));
ds_list_add(l, args(scr_talk, "Still waiting for my friend, you know."));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "q400"));
ds_list_add(l, args(scr_talk, "youve finished the quest, some event should happen, or something"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
