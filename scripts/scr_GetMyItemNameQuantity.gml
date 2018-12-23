var catch=argument0;

World.keep_going=true;

if (loot_quantity==1){
    return scr_GetMyItemNameIndefinite(null);
}

return string(loot_quantity)+' x '+ds_map_find_value(all_mod_packages, loot_package).my_items[loot].plural;
