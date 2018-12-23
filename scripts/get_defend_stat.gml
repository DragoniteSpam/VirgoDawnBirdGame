/// int get_defend_stat(entity, type);

return get_class(argument0).stat_defend[argument1]/**get_level(argument0.experience)*/+1+ds_map_find_value(all_mod_packages, argument0.equip_shield_package).my_items[argument0.equip_shield].item_power;
