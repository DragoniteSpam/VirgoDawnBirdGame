// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);

if (mp_current>=magic_cost[MagicTypes.invincibile]/*||World.debug*/){
    create_invincibile_blob(x, y, z, direction, 0, charge_level, id);
    mp_current=mp_current-magic_cost[MagicTypes.invincibile];
    stats_update_spells(MagicTypes.invincibile);
}
charge_level=0;
