/// void map_write_current(file);

with (lm){
    var buffer=buffer_create(power(2, 20), buffer_grow, 1);
    // General map settings
    var map=ds_map_create();
    ds_map_add(map, "version", MAP_VERSION);
    ds_map_add(map, "indoors", is_indoors);
    ds_map_add(map, "water", draw_water);
    ds_map_add(map, "locations", ds_list_size(locations));
    ds_map_add(map, "can_fast_travel", can_fast_travel);
    
    // Write the map map to the buffer
//    buffer_write(buffer, buffer_string, ds_map_write(map));
//    ds_map_destroy(map);
    
    // For each location
    for (var i=0; i<ds_list_size(lm.locations); i++){
        var loc=lm.locations[| i];
        with (loc){
            if (!loaded){
                location_load();
            }
        }
//        var lmap=ds_map_create();
        var lmap=map;   // i'll re-write this code later, maybe
        var str_prefix="loc_"+string(i)+"_";
        ds_map_add(lmap, str_prefix+"x", loc.x);
        ds_map_add(lmap, str_prefix+"y", loc.y);
        ds_map_add(lmap, str_prefix+"z", loc.z);
        ds_map_add(lmap, str_prefix+"radius", loc.radius);
        ds_map_add(lmap, str_prefix+"radius_load", loc.radius_load);
        ds_map_add(lmap, str_prefix+"name", loc.name);
        ds_map_add(lmap, str_prefix+"summary", loc.summary);
        ds_map_add(lmap, str_prefix+"icon", loc.icon);
        ds_map_add(lmap, str_prefix+"music_type_package", loc.music_type_package);
        ds_map_add(lmap, str_prefix+"music_type", loc.music_type);
        ds_map_add(lmap, str_prefix+"environment", loc.environment);
        ds_map_add(lmap, str_prefix+"index", loc.index);
        ds_map_add(lmap, str_prefix+"things", ds_list_size(loc.things));
        
        ds_map_add(lmap, str_prefix+"teleport_x", loc.teleport_x);
        ds_map_add(lmap, str_prefix+"teleport_y", loc.teleport_y);
        ds_map_add(lmap, str_prefix+"teleport_z", loc.teleport_z);
        ds_map_add(lmap, str_prefix+"teleport_direction", loc.teleport_direction);
        
        // For each Thing
        
        for (var j=0; j<ds_list_size(loc.things); j++){
            with (loc.things[| j]){
                script_execute(save_script, lmap, str_prefix+string(j)+"_");
            }
        }
//        buffer_write(buffer, buffer_string, ds_map_write(lmap));
//        ds_map_destroy(lmap);
    }
    
    // okay now you can do this
    buffer_write(buffer, buffer_string, ds_map_write(map));
    // Dump on the disk
    buffer_save_ext(buffer, argument0, 0, buffer_tell(buffer));
    // whoops we had a memory leak here
    buffer_delete(buffer);
}
