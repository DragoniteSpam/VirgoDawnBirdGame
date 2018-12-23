var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_talk, "You died. On noes!"));
ds_list_add(l, args(scr_lock_unset));
ds_list_add(l, args(scr_to_title));

return l;
