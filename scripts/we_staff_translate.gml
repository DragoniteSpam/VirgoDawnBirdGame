// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);

create_translate_blob(x, y, z, direction, 0, charge_level, id);
hp_current=max(hp_current-magic_cost[MagicTypes.heal], 0);
// Don't do this.
if (hp_current<=0){
    DIE(noone, DeathTypes.death_translate);
}
charge_level=0;
stats_update_spells(MagicTypes.translate);
