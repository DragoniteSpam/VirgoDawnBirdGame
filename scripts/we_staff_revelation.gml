// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);

if (mp_current>=magic_cost[MagicTypes.revelation]/*||World.debug*/){
    create_revelation_blob(x, y, z, direction, 0, charge_level, id);
    mp_current=mp_current-magic_cost[MagicTypes.revelation];
    stats_update_spells(MagicTypes.revelation);
}
charge_level=0;
