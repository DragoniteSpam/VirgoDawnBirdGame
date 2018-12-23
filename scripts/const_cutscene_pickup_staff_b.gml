var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_push, 0, scr_GetMyText));
ds_list_add(l, args(scr_talk, "&0"));
ds_list_add(l, args(scr_push_raw, 0, Items.STAFF));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Items.STAFF, Misc.equal, true, scr_goto, "end"));
ds_list_add(l, args(scr_set_multi_option, "Yeah.", 0, "Leave it.", 1));
ds_list_add(l, args(scr_talk, "Take the staff?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_add_item, Items.STAFF, 1));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_move_to, NPCs.ItemStaffB, 0, 0, 0));
ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
