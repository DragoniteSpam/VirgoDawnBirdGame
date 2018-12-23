/// void map_read(map);

// So that newly added entities don't get added to the previous map's Locations.
World.edit_map_active_location=noone;

with (argument0){
    var fn='.\maps\'+map_file+'.map';
    if (file_exists(fn)){
        var buffer=buffer_load(fn);
        var map=ds_map_create();
        ds_map_read(map, buffer_read(buffer, buffer_string));
        
        // General map settings
        
        var version=map[? "version"];
        is_indoors=map[? "indoors"];
        draw_water=map[? "water"];
        if (ds_map_exists(map, "can_fast_travel")){
            can_fast_travel=map[? "can_fast_travel"];
        }
        
        if (version>MAP_VERSION_BASE){
            // Old map format: load each entity, don't attach to a Location
            if (version==MAP_VERSION_NO_LOCATIONS){
                var n=map[? "number_selectable"];
                var i=0;
                repeat(n){
                    var map_sub=ds_map_create();
                    ds_map_read(map_sub, buffer_read(buffer, buffer_string));
                    
                    with (instance_create(map_sub[? "x"], map_sub[? "y"], all_entity_types[map_sub[? "etype"]])){
                        script_execute(load_script, map_sub);
                    }
                    ds_map_destroy(map_sub);
                    i++;
                }
            // New map format: go through Locations
            } else if (version==MAP_VERSION_LOCATION_1){
                var n=map[? "locations"];
                for (var i=0; i<n; i++){
                    var loc=add_location("", 0);
                    ds_list_add(locations, loc);
                    var lmap=ds_map_create();
                    ds_map_read(lmap, buffer_read(buffer, buffer_string));
                    loc.x=lmap[? "x"];
                    loc.y=lmap[? "y"];
                    loc.z=lmap[? "z"];
                    loc.radius=lmap[? "radius"];
                    loc.radius_load=lmap[? "radius_load"];
                    loc.name=lmap[? "name"];
                    loc.summary=lmap[? "summary"];
                    loc.icon=lmap[? "icon"];
                    if (ds_map_exists(lmap, "music_type_package")){
                        loc.music_type_package=lmap[? "music_type_package"];
                    }
                    loc.music_type=lmap[? "music_type"];
                    loc.environment=lmap[? "environment"];
                    loc.index=lmap[? "index"];
                    if (ds_map_exists(lmap, "teleport_x")){
                        loc.teleport_x=lmap[? "teleport_x"];
                        loc.teleport_y=lmap[? "teleport_y"];
                        loc.teleport_z=lmap[? "teleport_z"];
                        loc.teleport_direction=lmap[? "teleport_direction"];
                    }
                    
                    // For each Thing
                    
                    var nthings=lmap[? "things"];
                    for (var j=0; j<nthings; j++){
                        var smap=ds_map_create();
                        ds_map_read(smap, lmap[? string(j)]);
                        
                        with (instance_create(smap[? "x"], smap[? "y"], all_entity_types[smap[? "etype"]])){
                            script_execute(load_script, smap);
                            location=loc.index;
                            ds_list_add(loc.things, id);
                            script_execute(collision_adder, id);
                            
                            script_execute(on_reload);
                        }
                        ds_map_destroy(smap);
                    }
                    ds_map_destroy(lmap);
                }
            }
        }
        ds_map_destroy(map);    // this sounds wrong . . .
        buffer_delete(buffer);
    }
    return id;
}
