/// int get_damage(attacker, defender, type, attack strength, [weapon item], [armor item], [damage_multiplier]);

var weapon=ds_map_find_value(all_mod_packages, argument[0].equip_weapon_package).my_items[argument[0].equip_weapon];
var armor=ds_map_find_value(all_mod_packages, argument[1].equip_shield_package).my_items[argument[0].equip_shield]
var damage_mult=1;

switch (argument_count){
    case 7:
        damage_mult=argument[6];
    default:
        armor=argument[5];
        weapon=argument[4];
        break;
}

var base_damage=sqrt(max(0.1, weapon.item_power-armor.item_power))/**get_level(argument[0].experience)*/+
    power(get_attack_stat(argument[0], argument[2]), 2.5)/power(get_defend_stat(argument[1], argument[2]), 1.5)*sqrt(1+argument[3]);

return damage_mult*base_damage;
