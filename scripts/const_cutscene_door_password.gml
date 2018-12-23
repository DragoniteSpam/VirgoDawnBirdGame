var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_string_input_set, "", 64));
ds_list_add(l, args(scr_talk, "This door requires a password to open. What do you say?"));
ds_list_add(l, args(scr_string_input_hide));
ds_list_add(l, args(scr_do_if, scr_GetInputStringEqualsPassword, Misc.equal, true, scr_unlock_me));
ds_list_add(l, args(scr_do_if, scr_GetInputStringEqualsPassword, Misc.equal, true, scr_talk, "You can hear a lock click!"));
ds_list_add(l, args(scr_do_if, scr_GetInputStringEqualsPassword, Misc.equal, false, scr_talk, ". . . nothing."));
ds_list_add(l, args(scr_lock_unset));

return l;
