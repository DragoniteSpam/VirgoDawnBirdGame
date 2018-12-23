var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_set_multi_option, "Sure", 0, "Nah", 1));
ds_list_add(l, args(scr_talk, "Would you like to save the game?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_sys_save));
ds_list_add(l, args(scr_lock_unset));

return l;
