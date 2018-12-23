var l=ds_list_create();

ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 700, scr_move_to, NPCs.NPCMQBlueJay, 0, 0, 0));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 800, scr_move_to, NPCs.NPCMQBlueJay, 0, 0, 0));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 900, scr_move_to_marker, NPCs.NPCMQBlueJay, NPCs.WaypointMQ01_800_00, true));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1000, scr_move_to_marker, NPCs.NPCMQBlueJay, NPCs.WaypointMQ01_800_00, true));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1100, scr_move_to_marker, NPCs.NPCMQBlueJay, NPCs.WaypointMQ01_800_00, true));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1000, scr_move_to, NPCs.NPCMQPigeon, 0, 0, 0));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1100, scr_move_to, NPCs.NPCMQPigeon, 0, 0, 0));

return l;


