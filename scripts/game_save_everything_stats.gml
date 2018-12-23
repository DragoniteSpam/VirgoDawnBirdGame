/// void game_save_everything_stats(map);

with (Player){
    var n_locations=ds_list_size(stat_death_locations);
    ds_map_add(argument0, "stat_locations", n_locations);
    
    for (var i=0; i<n_locations; i++){
        ds_map_add(argument0, "stat_location_"+string(i), stat_death_locations[| i]);
    }
    
    var n_methods=array_length_1d(stat_death_methods);
    ds_map_add(argument0, "stat_death_method_size", n_methods);
    
    for (var i=0; i<n_methods; i++){
        ds_map_add(argument0, "stats_death_method_"+string(i), stat_death_methods[i]);
    }
    
    ds_map_add(argument0, "stat_distance_walked", stat_distance_walked);
    ds_map_add(argument0, "stat_jumps", stat_jumps);
    ds_map_add(argument0, "stat_arrows", stat_arrows);
    ds_map_add(argument0, "stat_foe_defeats", stat_foe_defeats);
    ds_map_add(argument0, "stat_menu_open", stat_menu_open);
    ds_map_add(argument0, "stat_potions_consumed", stat_potions_consumed);
    
    ds_map_add(argument0, "stat_spells", stat_spells);
    var n_spell_types=array_length_1d(stat_spell_types);
    ds_map_add(argument0, "stat_spell_types_size", n_spell_types);

    for (var i=0; i<n_spell_types; i++){
        ds_map_add(argument0, "stat_spell_types_"+string(i), stat_spell_types[i]);
    }
}
