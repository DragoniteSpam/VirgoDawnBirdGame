if (HasItem(BASE_ASSET, Items.GEAR)!=noone){
    anim_cast_rate=180/(room_speed/2);
    create_gear_frisbee(x, y, z+EYE_LEVEL, direction, pitch, charge_level, ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index].actor);
    charge_level=0;
    RemoveItem(BASE_ASSET, Items.GEAR, 1);
} else {
    AddNotification("You don't have any more gears!");
}
