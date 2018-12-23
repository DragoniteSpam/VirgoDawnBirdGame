var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Technology just blows my mind!"));
ds_list_add(l, args(scr_lock_unset));

return l;
