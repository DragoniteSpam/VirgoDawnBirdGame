// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);
if (mp_current>=magic_cost[MagicTypes.bloom]){
    create_bloom_blob(x, y, z+EYE_LEVEL, direction, pitch, charge_level, ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index].actor);
    mp_current=mp_current-magic_cost[MagicTypes.bloom];
    stats_update_spells(MagicTypes.bloom);
}
charge_level=0;