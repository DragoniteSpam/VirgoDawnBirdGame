/// ItemPocket add_item_pocket(name, icon, sound, item equip type);

with (instantiate(ItemPocket)){
    name=argument[0];
    icon=argument[1];
    se=argument[2];
    item_equip_type=argument[3];
    return id;
}
