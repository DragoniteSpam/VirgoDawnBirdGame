// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);

if (mp_current>=magic_cost[MagicTypes.sproing]){
    create_sproing_blob(x, y, z+EYE_LEVEL, direction, pitch, charge_level, id);
    mp_current=mp_current-magic_cost[MagicTypes.sproing];
    stats_update_spells(MagicTypes.sproing);
}
charge_level=0;
