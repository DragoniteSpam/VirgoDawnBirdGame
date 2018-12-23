/// editor_save_main_generic(asset array, asset map, required map, asset script, generic script, get from name);

ds_map_add(argument1, World.mod_internal_name+"_n", array_length_1d(argument0));

for (var i=0; i<array_length_1d(argument0); i++){
    script_execute(argument3, World.mod_internal_name, argument0[i], argument1, i);
}

// To save some space, don't save the 'required' data if there is none.
if (ds_list_size(argument2)>0){
    var changes=ds_map_as_array(argument2);
    
    ds_map_add(argument1, World.mod_internal_name+"_required", ds_map_write(argument2));
    
    // This process will not be fast if you have a lot of dependencies.
    for (var i=0; i<array_length_1d(changes); i++){
        ds_map_add(argument1, World.mod_internal_name+"_required_"+string(i), changes[i]);
    
        var spl=split(changes[i], ".");
        var package=ds_queue_dequeue(spl);
        var internal_name=ds_queue_dequeue(spl);
        ds_queue_destroy(spl);
        
        var index=script_execute(argument5, package, internal_name, 0);
        var arr=script_execute(argument4, package);
        
        if (is_clamped(index, 1, array_length_1d(arr)-1)){
            script_execute(argument3, package, arr[index], argument1, index);
        }
    }
}
