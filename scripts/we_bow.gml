if (HasItem(BASE_ASSET, Items.ARROW)!=noone){
    anim_cast_rate=180/(room_speed/2);
    create_arrow(x, y, z+EYE_LEVEL, direction, pitch, charge_level, ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index].actor);
    RemoveItem(BASE_ASSET, Items.ARROW, 1);
    stats_update_arrows();
} else {
    AddNotification("You don't have any more arrows!");
}
charge_level=0;
Camera.archery_fova=0;
