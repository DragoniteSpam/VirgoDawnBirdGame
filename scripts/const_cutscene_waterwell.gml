var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_talk, "It's  well! There's water in it."));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_goto, "end"));
ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
