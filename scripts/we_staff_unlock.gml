// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);
if (mp_current>=magic_cost[MagicTypes.unlock]){
    create_unlocky_blob(x, y, z+EYE_LEVEL, direction, pitch, charge_level, ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index].actor);
    mp_current=mp_current-magic_cost[MagicTypes.unlock];
    stats_update_spells(MagicTypes.unlock);
}
charge_level=0;
