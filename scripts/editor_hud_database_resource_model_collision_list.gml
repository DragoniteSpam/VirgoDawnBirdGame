/// editor_hud_database_resource_model_collision_list(resource);

var vra=get_vra_container_from_name(argument0.archive, World.active_vra_container);

// can't be an invalid container so don't worry about that

if (ds_map_size(vra.hash)>0){
    var key=ds_map_find_first(vra.hash);
    if (string_starts_with(key, "C_")){
        if (string_length(edit_database_filter)==0||string_count(edit_database_filter, key)>0){
            ds_list_add(edit_database_filter_list, key);
        }
    }
    
    do {
        key=ds_map_find_next(vra.hash, key);
        if (string_starts_with(key, "C_")){
            if (string_length(edit_database_filter)==0||string_count(edit_database_filter, key)>0){
                ds_list_add(edit_database_filter_list, key);
            }
        }
    } until(key==ds_map_find_last(vra.hash));
}
