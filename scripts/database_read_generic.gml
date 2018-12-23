/// database_read_generic(ModPackage, map, prefix, array get, array set, reader script, get from name, required setter);

// Normally I don't do this but this time I got lost in the sea of arguments.

var original_package=argument0;
var map=argument1;
var prefix=argument2;
var array_get_script=argument3;
var array_set_script=argument4;
var reader_script=argument5;
var get_from_name_script=argument6;
var required_setter=argument7;

var ret=DatabaseErrors.no;

var n=map[? argument0.name+"_n"];

var arr=array_add(n, noone);

for (var i=0; i<n; i++){
    // we need to pass this as a parameter because I'm stupid and left it in the save script
    // as if I needed it there
    var base_string=prefix+"_"+argument0.name+"_"+string(i)+"_";
    //return database_read_items_thanks(base_string, argument1);
    arr[i]=script_execute(reader_script, base_string, map);
}

script_execute(array_set_script, argument0, arr);

if (ds_map_exists(map, argument0.name+"_required")){
    var req=ds_map_create();
    ds_map_read(req, map[? argument0.name+"_required"]);
    
    script_execute(required_setter, argument0, req);

    var n_required=ds_map_size(req);
    
    for (var i=0; i<n_required; i++){
        var base_string=map[? argument0.name+"_required_"+string(i)];
        
        var spl=split(base_string, '.');
        var package=deq(spl);
        var internal_name=deq(spl);
        ds_queue_destroy(spl);
        
        var index=script_execute(get_from_name_script, package, internal_name, 0);
        
        if (!ds_map_exists(all_mod_packages, package)){
            ret=ret|DatabaseErrors.missing_mod;
        }
        
        var mod_package=ds_map_find_value(all_mod_packages, package);
        
        var new_array=script_execute(array_get_script, mod_package);
        
        if (is_clamped(index, 1, array_length_1d(new_array))){
            new_array[index]=script_execute(reader_script, base_string, map);
        }
        
        // we need to reset the array because apparently game maker is dumb and breaks pass-by-reference or something
        script_execute(array_set_script, mod_package, new_array);
    }
}

return ret;
