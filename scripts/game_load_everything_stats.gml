/// void game_load_everything_stats(map);

with (Player){
    ds_list_clear(stat_death_locations);
    var n_locations=argument0[? "stat_locations"];
    
    for (var i=0; i<n_locations; i++){
        ds_list_add(stat_death_locations, argument0[? "stat_location_"+string(i)]);
    }
    
    var n_methods=argument0[? "stat_death_method_size"];
    
    for (var i=0; i<n_methods; i++){
        stat_death_methods[i]=argument0[? "stats_death_method_"+string(i)];
    }
    
    stat_distance_walked=argument0[? "stat_distance_walked"];
    stat_jumps=argument0[? "stat_jumps"];
    stat_arrows=argument0[? "stat_arrows"];
    stat_foe_defeats=argument0[? "stat_foe_defeats"];
    stat_menu_open=argument0[? "stat_menu_open"];
    stat_potions_consumed=argument0[? "stat_potions_consumed"];
    
    stat_spells=argument0[? "stat_spells"];    
    
    var n_spell_types=argument0[? "stat_spell_types_size"];

    for (var i=0; i<n_spell_types; i++){
        stat_spell_types[i]=argument0[? "stat_spell_types_"+string(i)];
    }
}
