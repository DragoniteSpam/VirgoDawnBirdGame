var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_talk, "Yo. Have you checked out the game's credits yet?"));
ds_list_add(l, args(scr_push_raw, 0, BooleanFlags.HasCreditsBook));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equal, LOCKED, scr_goto, "NOITEM"));
ds_list_add(l, args(scr_push_raw, 0, BooleanFlags.HasReadCreditsBook));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equal, LOCKED, scr_goto, "PROMPT"));

ds_list_add(l, args(scr_keyword, "GIVEACH"));
ds_list_add(l, args(scr_talk, "Whoa, you actually have!"));
ds_list_add(l, args(scr_goto, "END"));

ds_list_add(l, args(scr_keyword, "PROMPT"));
ds_list_add(l, args(scr_talk, "Well, I'm sure the developers would appreciate it if you did that.",));
ds_list_add(l, args(scr_goto, "END"));

ds_list_add(l, args(scr_keyword, "NOITEM"));
ds_list_add(l, args(scr_talk, "Of course not. You haven't been given a copy of them yet."));
ds_list_add(l, args(scr_talk, "Here, you can have mine. It's not like I ever read them, anyway."));
ds_list_add(l, args(scr_add_item, Items.BCREDITS, 1));
ds_list_add(l, args(scr_set_boolean_flag, BooleanFlags.HasCreditsBook, UNLOCKED));

ds_list_add(l, args(scr_keyword, "END"));
ds_list_add(l, args(scr_lock_unset));

return l;
