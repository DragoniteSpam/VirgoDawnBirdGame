var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_fade, c_black, 1, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_teleport, Maps.cave, TeleportSpots.CaveFromPatience));
ds_list_add(l, args(scr_fade, c_black, 0, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_lock_unset));

return l;
