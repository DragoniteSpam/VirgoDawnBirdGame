var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_talk, "It's a bowl!"));
ds_list_add(l, args(scr_do_if, scr_GetEmptyFoodBowl, Misc.equal, true, scr_goto, "fillFood"));
ds_list_add(l, args(scr_do_if, scr_GetEmptyWaterBowl, Misc.equal, true, scr_goto, "fillWater"));
ds_list_add(l, args(scr_do_if, scr_GetEmptyUnknownBowl, Misc.equal, true, scr_goto, "fillUnknown"));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "fillFood"));
ds_list_add(l, args(scr_talk, "It's labeled "+'"FOOD."'));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_talk, "You don't have any feed . . ."));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_goto, "end"));
ds_list_add(l, args(scr_set_multi_option, "Yeah", 0, "Nope", 1));
ds_list_add(l, args(scr_talk, "Fill it up with food?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "fillWater"));
ds_list_add(l, args(scr_talk, "It's labeled "+'"WATER."'));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_talk, "You don't have any water . . ."));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_goto, "end"));
ds_list_add(l, args(scr_set_multi_option, "Yeah", 0, "Nope", 1));
ds_list_add(l, args(scr_talk, "Fill it up with water?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_bowl_fill_water));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "fillUnknown"));
ds_list_add(l, args(scr_talk, "It's not labeled. Better not mess with it."));
ds_list_add(l, args(scr_goto, "end"));

ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
