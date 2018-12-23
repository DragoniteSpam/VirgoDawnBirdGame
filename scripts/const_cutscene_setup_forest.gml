var l=ds_list_create();

ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1100, scr_move_to_marker, NPCs.NPCMQEagle, NPCs.WaypointMQ00_1100));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1200, scr_move_to, NPCs.NPCMQEagle, 0, 0, 0));

return l;
