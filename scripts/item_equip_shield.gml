/// void item_equip_shield(base item);

if (get_class(Player.id).weilding){
    if (Player.equip_shield==argument0.index){
        Player.equip_shield_package=BASE_ASSET;
        Player.equip_shield=0;
    } else {
        Player.equip_shield_package=argument0.mod_package;
        Player.equip_shield=argument0.index;
    }
} else {
    AddNotification("Can't equip that now!");
}
