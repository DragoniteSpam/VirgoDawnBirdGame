// This retrieves the KEYS in the ds_map and stuffs them all into an array.
// If you want the VALUES just look up map[? key[whatever]].

var array=array_create(ds_map_size(argument0));

if (ds_map_size(argument0)>0){
    var n=0;
    var key=ds_map_find_first(argument0);
    array[n++]=key;
    
    while (key!=ds_map_find_last(argument0)) {
        key=ds_map_find_next(argument0, key);
        array[n++]=key;
    }
}

return array;
