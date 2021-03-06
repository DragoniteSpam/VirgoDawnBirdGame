switch (combat_state){
    case Misc.begin_combat:
        combat_state=Misc.charging;
        timer_evaluate_combat=room_speed/4;
        break;
    case Misc.charging:
        var distance=point_distance_3d(x, y, z, aggro_target.x, aggro_target.y, aggro_target.z);
        if (distance>AI_RADIUS_MAX_FLEE){
            MOVE_STOP(true);
            combat_state=Misc.begin_combat;
            aggro_target=noone;
        } else if (distance<AI_FOLLOWER_DISTANCE_MAX){
            MOVE_STOP(false);
        } else {
            MOVE_WALK(direction, MOVE_SPEED_RUN*3/4);
        }
        break;
    case Misc.preparing:
        charge_level=charge_level+World.delta_time_seconds;
        break;
    case Misc.attacking:
        var miss;
        switch (difficulty){
            case DifficultyModes.noob:
                miss=24;
                break;
            case DifficultyModes.easy:
                miss=16;
                break;
            case DifficultyModes.regular:
                miss=12;
                break;
            case DifficultyModes.hard:
                miss=6;
                break;
            case DifficultyModes.masochist:
                miss=4;
                break;
        }
        var dir=point_direction(x, y, aggro_target.x, aggro_target.y)+random_range(-miss, miss);
        var pch=darctan((z-aggro_target.z)/distance_to_object(aggro_target))+random_range(-miss, miss);
        create_baseball(x, y, z+EYE_LEVEL, dir, pch, charge_level, id);
        charge_level=0;
        combat_state=Misc.charging;
        timer_evaluate_combat=room_speed;
        break;
    case Misc.idle:
        // wait?
        break;
}
