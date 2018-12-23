// 180/number of frames to animation completion
anim_cast_rate=180/(room_speed/2);
var level=get_level(Player.experience);
if (magic_current>=magic_cost[MagicTypes.heal]){
    create_invincibile_blob(x, y, z, direction, 0, charge_level, id);
    magic_current=magic_current-magic_cost[MagicTypes.heal];
}
hp_current=max(hp_current-magic_cost[MagicTypes.heal], 0);
charge_level=0;
