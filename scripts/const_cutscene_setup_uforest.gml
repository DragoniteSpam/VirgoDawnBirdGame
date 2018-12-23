var l=ds_list_create();

ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct2));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 100, scr_goto, "greeter"));
ds_list_add(l, args(scr_goto, "end"));
ds_list_add(l, args(scr_keyword, "greeter"));
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, NPCs.ActivePlayer, NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQUndergroundGreeter, NPCs.ActivePlayer));
ds_list_add(l, args(scr_walk, NPCs.NPCMQUndergroundGreeter, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_stop, NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_talk, "Huh, I don't recognize you.", NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_set_multi_option, "Nope.", 0, "In a trapdoor in a shed?", 1));
ds_list_add(l, args(scr_talk, "Do you know where you are?", NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_talk, "This is a place known as the Underground.", NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_talk, "Try not to cause any trouble, okay?", NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_turn, NPCs.NPCMQUndergroundGreeter, 5, 180, false));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_walk, NPCs.NPCMQUndergroundGreeter, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_stop, NPCs.NPCMQUndergroundGreeter));
ds_list_add(l, args(scr_validate_quests, 12100));
ds_list_add(l, args(scr_lock_unset));
ds_list_add(l, args(scr_keyword, "end"));

return l;
