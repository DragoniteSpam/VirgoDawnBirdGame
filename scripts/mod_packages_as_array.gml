var arr=array_create(ds_map_size(all_mod_packages));

var n=0;
var key=ds_map_find_first(all_mod_packages);
arr[n++]=key;
do {
    key=ds_map_find_next(all_mod_packages, key);
    arr[n++]=key;
} until(key==ds_map_find_last(all_mod_packages));

return arr;
