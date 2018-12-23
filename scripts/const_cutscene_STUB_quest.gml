/// cutscene const_cutscene_STUB_quest(quest);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Begin quest: "+all_quests[argument0].name));
ds_list_add(l, args(scr_quest_begin, argument0));
ds_list_add(l, args(scr_lock_unset));

return l;
