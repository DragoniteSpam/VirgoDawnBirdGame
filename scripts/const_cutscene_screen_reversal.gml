var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_set_multi_option, "Flip Game Horizontally", 0, "Flip Game Vertically", 1, "This sounds like a really, really bad idea", 2));
ds_list_add(l, args(scr_talk, "Ever get bored of the game's default orientation? You can change that!"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_sys_flip_horizontal));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_sys_flip_vertical));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_talk, "You aren't any fun."));
ds_list_add(l, args(scr_lock_unset));

return l;
