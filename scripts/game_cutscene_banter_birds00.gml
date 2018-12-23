var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_set_multi_option, "Yeah!", 0, "Not really . . .", 1));
ds_list_add(l, args(scr_talk, "Hello, \p! Enjoying your time at the Aviary?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_talk, "Glad to hear it! I like it here, too!"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_talk, "Sorry to hear that . . . I'm sure it'll grow on you, though!"));
ds_list_add(l, args(scr_lock_unset));

return l;
