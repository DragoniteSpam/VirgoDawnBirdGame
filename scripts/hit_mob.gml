/// boolean hit_mob(type, attacker, strength, [damage_multiplier]);

var type=CombatTypes.electric;
var attacker=noone;
var strength=noone;
var damage_mult=1;

switch (argument_count){
    case 4:
        damage_mult=argument[3];
    default:
        type=argument[0];
        attacker=argument[1];
        strength=argument[2];
        break;
}

// Check for the five basic combat types, because these are the only ones
// that can deal damage.
if (timer_invincibility<=0){
    if (argument0&(CombatTypes.electric|CombatTypes.fire|CombatTypes.smash|CombatTypes.boom|CombatTypes.pierce|CombatTypes.ice)){
        var weapon=ds_map_find_value(all_mod_packages, attacker.equip_weapon_package).my_items[attacker.equip_weapon];
        var shield=ds_map_find_value(all_mod_packages, equip_shield_package).my_items[equip_shield];
        var damage=get_damage(attacker, id, type, strength, weapon, shield, damage_mult);
        hp_current=max(0, hp_current-damage);
        
        if (aggro_level==Aggro.neutral||aggro_level==Aggro.mad){
            set_aggro_target(argument1);
        }
        
        if (hp_current==0){
            DIE(attacker, DeathTypes.death_mob);
        }
        
        gravity_force=true;
    }
}

if (argument0&(CombatTypes.legilimens)){
    var str=script_execute(all_legilimens_text[legilimens_text]);
    if (string_length(str)>0){
        var f=120;
        create_thought_bubble(id, str, argument2*f);
    }
}
