var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_talk, "It's a grave."));
ds_list_add(l, args(scr_push_raw, 0, Items.GRAVEFLOWER));
ds_list_add(l, args(scr_do_if, scr_GetHasItem, Misc.equal, false, scr_goto, "end"));
ds_list_add(l, args(scr_set_multi_option, "Yeah", 0, "Nope", 1));
ds_list_add(l, args(scr_talk, "Would you like to leave a Gracidea?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_remove_item, Items.GRAVEFLOWER, 1));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_talk, "Left a flower by the grave."));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_effect_particle_static, Models.part_flower, 0, 3600));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_talk, "Did not leave a flower by the grave."));
ds_list_add(l, args(scr_keyword, "end"));
ds_list_add(l, args(scr_lock_unset));

return l;
