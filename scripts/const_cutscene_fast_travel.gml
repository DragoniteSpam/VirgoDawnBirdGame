// Make sure you've set a Fast Travel point in World.variable[0] before doing this!
var l=ds_list_create();
ds_list_add(l, args(scr_lock_set));
ds_list_add(l, args(scr_fade, c_black, 1, 1));
ds_list_add(l, args(scr_wait, 1.25));
ds_list_add(l, args(scr_fast_travel));
ds_list_add(l, args(scr_wait, 0.25));
ds_list_add(l, args(scr_fade, c_black, 0, 1));
ds_list_add(l, args(scr_wait, 1));
ds_list_add(l, args(scr_lock_unset));

return l;
