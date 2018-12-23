var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_do_if, scr_GetMyVarKey, Misc.equal, Items.NONE, scr_goto, "transition"));
ds_list_add(l, args(scr_push, 0, scr_GetMyVarKey));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_goto, "need"));
ds_list_add(l, args(scr_keyword, "transition"));
ds_list_add(l, args(scr_fade, c_black, 1, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_teleport_var));
ds_list_add(l, args(scr_fade, c_black, 0, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_goto, "end"));
ds_list_add(l, args(scr_keyword, "need"));
ds_list_add(l, args(scr_talk, "You lack the required item!"));
ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
