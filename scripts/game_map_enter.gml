/// void game_map_enter(map package, map index);

// This would happen on its own in the following with() block but
// just to be safe . . .
with (Selectable) if (deleteable){
    instance_destroy();
}

with (Gram){
    instance_destroy();
}

if (lm!=noone){
    with (Location){
        instance_destroy();
    }
    
    ds_list_clear(lm.locations);
}

ray_object=noone;
Player.location=noone;

lm=ds_map_find_value(all_mod_packages, argument0).my_maps[argument1];

with (lm){
    boolean_flags[discovery, BF_VALUE]=UNLOCKED;
}

map_read(lm);

with (Player){
    set_last_land();
}
