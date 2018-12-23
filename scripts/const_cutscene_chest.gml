var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
// @todo This will not work if "loot" is set to random.
ds_list_add(l, args(scr_push, 0, scr_GetMyItemName));
ds_list_add(l, args(scr_push, 1, scr_GetMyItemQuantity));
ds_list_add(l, args(scr_talk, "Found &0 x &1!"));
ds_list_add(l, args(scr_give_items));
ds_list_add(l, args(scr_validate_quests));
ds_list_add(l, args(scr_lock_unset));

return l;
