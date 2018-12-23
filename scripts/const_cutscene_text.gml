var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_push, 0, scr_GetMyText));
ds_list_add(l, args(scr_do_if, scr_GetMyDirectionFix, Misc.equal, false, scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "&0"));
ds_list_add(l, args(scr_lock_unset));

return l;
