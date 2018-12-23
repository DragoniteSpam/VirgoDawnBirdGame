var l=ds_list_create();

ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, Quests.qMainAct1));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.equal, 1100, scr_talk, "I was taking a nap on this hill, and all of the sudden there was a commotion and this giant brown bird comes falling out of the sky!"));
ds_list_add(l, args(scr_do_if, scr_GetQuestStage, Misc.not_equal, 1100, scr_talk, "How did I get up here, you ask? There's a secret trap door in the shed. That's all I'm going to say."));
ds_list_add(l, args(scr_lock_unset));

return l;
