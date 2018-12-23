/// ItemEffect add_item_weapon_effect(name, script);

with (instantiate(ItemWeaponEffect)){
    name=argument[0];
    script=argument[1];
    return id;
}
