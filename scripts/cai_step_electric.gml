switch (combat_state){
    case Misc.searching:
        direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        combat_state=Misc.idle;
        alarm[COMBAT_EVALUATE_ALARM]=room_speed/4;
        break;
    case Misc.charging:
        break;
    case Misc.preparing:
        break;
    case Misc.attacking:
        break;
    case Misc.idle:
        break;
}
