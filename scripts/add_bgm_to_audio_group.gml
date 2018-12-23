/// void add_bgm_to_audio_group(ag package, audio group, bgm package, bgm id);

var package=ds_map_find_value(all_mod_packages, argument0);

ds_list_add(package.my_audio_groups[argument1].packages, argument2);
ds_list_add(package.my_audio_groups[argument1].songs, package.my_bgm[argument3].song);
