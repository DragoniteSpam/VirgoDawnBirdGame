/// int get_attack_stat(entity, type);

return get_class(argument0).stat_attack[argument1]/**get_level(argument0.experience)*/+1+ds_map_find_value(all_mod_packages, argument0.equip_weapon_package).my_items[argument0.equip_weapon].item_power;
