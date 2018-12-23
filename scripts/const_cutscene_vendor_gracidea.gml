var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_set_multi_option, "I do!", 0, "Nah.", 1));
ds_list_add(l, args(scr_talk, "Do you like flowers?", true));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_add_item, Items.GRAVEFLOWER, 1));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_talk, "So do I! It's nice to see eye-to-eye on things with people, right?"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_talk, "You don't like flowers? Aw, that's a shame."));
ds_list_add(l, args(scr_lock_unset));

return l;
