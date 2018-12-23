var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_talk, "Stepped on an event space!"));
ds_list_add(l, args(scr_hide_me));
ds_list_add(l, args(scr_lock_unset));

return l;
