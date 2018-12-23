/// void load_entity(file);

load_principle(argument0);
// zstart

model=argument0[? "model"];
model_index=argument0[? "model_index"];
set_alive(argument0[? "alive"]);

owner=argument0[? "owner"];
music=argument0[? "music"];
script=argument0[? "script"];
text_speed_modifier=argument0[? "text_speed_modifier"];
image=argument0[? "image"];

xrotspeed=argument0[? "xrotspeed"];
yrotspeed=argument0[? "yrotspeed"];
zrotspeed=argument0[? "zrotspeed"];
xspeed=argument0[? "xspeed"];
yspeed=argument0[? "yspeed"];
zspeed=argument0[? "zspeed"];

trainer_id=argument0[? "trainer_id"];
friendship=argument0[? "friendship"];
active=argument0[? "active"];

if (ds_map_exists(argument0, "on_hit")){
    on_hit=argument0[? "on_hit"];
}

if (ds_map_exists(argument0, "loot")){
    loot=argument0[? "loot"];
}

if (ds_map_exists(argument0, "loot_quantity")){
    loot_quantity=argument0[? "loot_quantity"];
}

if (ds_map_exists(argument0, "loot_flag")){
    loot_flag=argument0[? "loot_flag"];
}

if (ds_map_exists(argument0, "hidden")){
    hidden=argument0[? "hidden"];
    if (hidden){
        mask=COLLISION_DONT_MESS_WITH_ME;
    }
}

if (ds_map_exists(argument0, "legilimens_text")){
    legilimens_text=argument0[? "legilimens_text"];
}

if (ds_map_exists(argument0, "on_death")){
    on_death=argument0[? "on_death"];
}

if (ds_map_exists(argument0, "bleedout_cutscene")){
    bleedout_cutscene=argument0[? "bleedout_cutscene"];
}

if (ds_map_exists(argument0, "bleedout_reset_aggro")){
    bleedout_reset_aggro=argument0[? "bleedout_reset_aggro"];
}

if (ds_map_exists(argument0, "hit_flags")){
    hit_flags=argument0[? "hit_flags"];
}

if (ds_map_exists(argument0, "hit_flag_stun")){
    hit_flag_stun=argument0[? "hit_flag_stun"];
}

if (ds_map_exists(argument0, "hit_flag_stun_time")){
    hit_flag_stun_time=argument0[? "hit_flag_stun_time"];
}

if (ds_map_exists(argument0, "death_cutscene")){
    death_cutscene=argument0[? "death_cutscene"];
}

if (ds_map_exists(argument0, "exp_hp")){
    exp_hp=argument0[? "exp_hp"];
}

if (ds_map_exists(argument0, "exp_mp")){
    exp_mp=argument0[? "exp_mp"];
}

if (ds_map_exists(argument0, "class")){
    class=argument0[? "class"];
}

if (ds_map_exists(argument0, "handedness")){
    handedness=argument0[? "handedness"];
}

if (ds_map_exists(argument0, "equip_weapon_package")){
    equip_weapon_package=argument0[? "equip_weapon_package"];
}
if (ds_map_exists(argument0, "equip_weapon")){
    equip_weapon=argument0[? "equip_weapon"];
}
if (ds_map_exists(argument0, "equip_shield_package")){
    equip_shield_package=argument0[? "equip_shield_package"];
}
if (ds_map_exists(argument0, "equip_shield")){
    equip_shield=argument0[? "equip_shield"];
}

if (ds_map_exists(argument0, "combat_music_package")){
    combat_music_package=argument0[? "combat_music_package"];
}
if (ds_map_exists(argument0, "combat_music")){
    combat_music=argument0[? "combat_music"];
}

if (ds_map_exists(argument0, "occlude")){
    occlude=argument0[? "occlude"];
}

hp_current=get_max_hp(exp_hp);
mp_current=get_max_mp(exp_mp);
