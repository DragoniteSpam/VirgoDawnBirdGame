var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_talk, "It's a sign with some directions on it."));
ds_list_add(l, args(scr_set_multi_option, "Forest", 1));
ds_list_add(l, args(scr_push_raw, 0, BooleanFlags.HasVisitedRavine));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equal, true, scr_set_multi_option_more, "Ravine", 2));
ds_list_add(l, args(scr_push_raw, 0, BooleanFlags.HasVisitedCoast));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equal, true, scr_set_multi_option_more, "Shore", 3));
ds_list_add(l, args(scr_push_raw, 0, BooleanFlags.HasVisitedFarm));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equal, true, scr_set_multi_option_more, "Farm", 4));
ds_list_add(l, args(scr_set_multi_option_more, "Never mind", 0));
ds_list_add(l, args(scr_talk, "Which location would you like to visit?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_goto, "end"));

ds_list_add(l, args(scr_fade, c_black, 1, 1));
ds_list_add(l, args(scr_wait, 1));
//ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_teleport, Maps.forest, NPCs.MMForestFromTRT));
ds_list_add(l, args(scr_fade, c_black, 0, 1));
ds_list_add(l, args(scr_wait, 1));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
