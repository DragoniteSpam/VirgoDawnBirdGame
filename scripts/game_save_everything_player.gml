/// void game_save_everything_player(map);

with (Player){
    ds_map_add(argument0, "player_map_package", lm.mod_package);
    ds_map_add(argument0, "player_map", lm.index);
    ds_map_add(argument0, "player_x", x);
    ds_map_add(argument0, "player_y", y);
    ds_map_add(argument0, "player_z", z);
    ds_map_add(argument0, "player_direction", direction);
    
    ds_map_add(argument0, "player_money", money);
    ds_map_add(argument0, "player_trainer_id", trainer_id);
    
    ds_map_add(argument0, "player_class", class);
    ds_map_add(argument0, "player_spell", spell);
    ds_map_add(argument0, "player_exp_hp", exp_hp);
    ds_map_add(argument0, "player_exp_mp", exp_mp);
    ds_map_add(argument0, "player_hp_current", hp_current);
    ds_map_add(argument0, "player_mp_current", mp_current);
    
    ds_map_add(argument0, "player_equip_weapon", equip_weapon);
    ds_map_add(argument0, "player_equip_shield", equip_shield);
    
    ds_map_add(argument0, "player_name", name);
    ds_map_add(argument0, "player_nick", nick);
    
    ds_map_add(argument0, "player_time_start", time_start);
    ds_map_add(argument0, "player_time_play", time_play);
    ds_map_add(argument0, "player_pid", pid);
    ds_map_add(argument0, "player_iv", iv);
    
    ds_map_add(argument0, "player_last_land_x", last_land_x);
    ds_map_add(argument0, "player_last_land_y", last_land_y);
    ds_map_add(argument0, "player_last_land_z", last_land_z);
    ds_map_add(argument0, "player_last_land_direction", last_land_direction);

    ds_map_add(argument0, "player_gender", gender);
}
