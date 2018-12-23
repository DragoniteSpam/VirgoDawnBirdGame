var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));

// Main quest - introduction

ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 100, scr_goto, "mq01Storage"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 200, scr_goto, "mq02Notice"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 300, scr_goto, "mq03Cages"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 400, scr_goto, "mq04Rehab"));

ds_list_add(l, args(scr_talk, "Technology just blows my mind!"));
ds_list_add(l, args(scr_goto, "end"));

// "else"

ds_list_add(l, args(scr_keyword, "mq01Storage"));
ds_list_add(l, args(scr_talk, "This is the Storage Barn. We keep stuff in here for storage. It's normally locked, but Keymaster Ralph has the key if you ever need something out of it.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_camera_lock_onto_actor, NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_07));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_07, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_camera_unlock_onto_actor));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "mq02Notice"));
ds_list_add(l, args(scr_talk, "This is the Notice Board. When people are too lazy to run their own errands, sometimes they post a request on this board. If you ever don't feel like doing your job, this is a good place to look.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_camera_lock_onto_actor, NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_08));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_08, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_camera_unlock_onto_actor));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "mq03Cages"));
ds_list_add(l, args(scr_talk, "These are the bird cages. We have quite a few of them, as you can see. We keep birds in here until they're strong enough to fly away on their own.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_camera_lock_onto_actor, NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_09));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_09, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_10));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_10, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_camera_unlock_onto_actor));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "mq04Rehab"));
ds_list_add(l, args(scr_talk, "This is the Rehab Barn. Birds with more serious injuries go in here where we can more carefully regulate their diet and medication and stuff. Please don't make any loud noises when you're inside.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_talk, "Lastly, the big house where you were waiting for me when you arrived is the office. That's where the computer systems and bird feed and a few extra rehab cages are stored.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_talk, "You know, typical office stuff. With birds.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_talk, "Any questions?", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_talk, "Good!", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_talk, "You should speak with BOSS GUY for your first assignment.", NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_camera_lock_onto_actor, NPCs.NPCMQGreeter));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_09));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_09, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_11));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_11, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_03));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_03, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_02));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_02, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_01));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_01, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_12));
ds_list_add(l, args(scr_walk_to_waypoint, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_12, MOVE_SPEED_WALK));
ds_list_add(l, args(scr_turn_to_face, NPCs.NPCMQGreeter, NPCs.WaypointMQ00_03));   // this last one is so that he finishes facing the desk
ds_list_add(l, args(scr_camera_unlock_onto_actor));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
