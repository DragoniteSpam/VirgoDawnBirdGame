/// void game_load_everything_player(map);

with (Player){
    if (ds_map_exists(argument0, "player_map_package")){
        var load_map_package=argument0[? "player_map_package"];
    } else {
        var load_map_package=BASE_ASSET;
    }
    game_map_enter(load_map_package, argument0[? "player_map"]);
    x=argument0[? "player_x"];
    y=argument0[? "player_y"];
    z=argument0[? "player_z"];
    direction=argument0[? "player_direction"];

    money=argument0[? "player_money"];
    trainer_id=argument0[? "trainer_id"];
    
    class=argument0[? "player_class"];
    spell=argument0[? "player_spell"];
    exp_hp=argument0[? "player_exp_hp"];
    exp_mp=argument0[? "player_exp_mp"];
    hp_current=argument0[? "player_hp_current"];
    mp_current=argument0[? "player_mp_current"];
    
    equip_weapon=argument0[? "player_equip_weapon"];
    equip_shield=argument0[? "player_equip_shield"];
    
    if (ds_map_exists(argument0, "player_equip_weapon_package")){
        player_equip_weapon_package=argument0[? "player_equip_weapon_package"];
    }
    if (ds_map_exists(argument0, "player_equip_shield_package")){
        player_equip_shield_package=argument0[? "player_equip_shield_package"];
    }
    
    name=argument0[? "player_name"];
    nick=argument0[? "player_nick"];

    time_start=argument0[? "player_time_start"];
    time_play=argument0[? "player_time_play"];
    pid=argument0[? "player_pid"];
    iv=argument0[? "player_iv"];
    
    last_land_x=argument0[? "player_last_land_x"];
    last_land_y=argument0[? "player_last_land_y"];
    last_land_z=argument0[? "player_last_land_z"];
    last_land_direction=argument0[? "player_last_land_direction"];
    
    gender=argument0[? "player_gender"];
}
