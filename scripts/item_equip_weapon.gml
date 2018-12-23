/// void item_equip_weapon(base item);

if (get_class(Player.id).weilding){
    if (Player.equip_weapon==argument0.index){
        Player.equip_weapon_package=BASE_ASSET;
        Player.equip_weapon=0;
    } else {
        Player.equip_weapon_package=argument0.mod_package;
        Player.equip_weapon=argument0.index;
    }
} else {
    AddNotification("Can't equip that now!");
}
