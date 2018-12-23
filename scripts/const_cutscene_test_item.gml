var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_push_raw, 0, BooleanFlags.HasTestItem));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equal, UNLOCKED, scr_goto, "HAS"));
ds_list_add(l, args(scr_talk, "I'm giving you a ton of TMs in the hopes that you'll be able to use them without breaking the game. Good luck."));
ds_list_add(l, args(scr_talk, "Check your inventory."));
ds_list_add(l, args(scr_set_boolean_flag, BooleanFlags.HasTestItem, UNLOCKED));
ds_list_add(l, args(scr_goto, "END"));
ds_list_add(l, args(scr_keyword, "HAS"));
ds_list_add(l, args(scr_talk, "What? I already gave you the stuff."));
ds_list_add(l, args(scr_talk, "Go away."));
ds_list_add(l, args(scr_keyword, "END"));
ds_list_add(l, args(scr_lock_unset));

return l;
