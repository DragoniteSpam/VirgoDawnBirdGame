var n=array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_bgm);
var bgm=add_bgm("BGM"+string(n+1), "BGM "+string(n+1), false, noone, '', '');
(ds_map_find_value(all_mod_packages, edit_database_package)).my_bgm[n]=bgm;

return bgm;
