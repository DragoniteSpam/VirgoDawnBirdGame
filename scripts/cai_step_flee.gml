switch (combat_state){
    case Misc.begin_combat:
        timer_evaluate_combat=room_speed/4;
        combat_state=Misc.charging;
        break;
    case Misc.charging:
        if (point_distance_3d(x, y, z, aggro_target.x, aggro_target.y, aggro_target.z)<AI_RADIUS_MAX_FLEE){
            MOVE_WALK(direction, MOVE_SPEED_RUN*3/4);
        } else {
            MOVE_STOP(false);
            combat_state=Misc.begin_combat;
            aggro_target=noone;
        }
        break;
}
