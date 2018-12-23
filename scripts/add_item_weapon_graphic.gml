/// ItemEffect add_item_weapon_graphic(name, script);

with (instantiate(ItemWeaponGraphic)){
    name=argument[0];
    script=argument[1];
    return id;
}
