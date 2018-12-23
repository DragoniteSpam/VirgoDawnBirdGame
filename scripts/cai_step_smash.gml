switch (combat_state){
    case Misc.begin_combat:
        combat_state=Misc.charging;
        timer_evaluate_combat=room_speed/4;
        break;
    case Misc.charging:
        // this is a terrible way of doing things but I'm doing them anyway
        if (irandom(room_speed/3)==5){
            direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        }
        var distance=point_distance_3d(x, y, z, aggro_target.x, aggro_target.y, aggro_target.z);
        if (distance>AI_RADIUS_MAX_FLEE){
            MOVE_STOP(true);
            combat_state=Misc.begin_combat;
            aggro_target=noone;
        } else if (distance<32){
            MOVE_STOP(true);
            // shoot me
            if (irandom(room_speed/2)==0){
                combat_state=Misc.preparing;
                timer_evaluate_combat=room_speed/4;
            }
        } else {
            MOVE_WALK(direction, MOVE_SPEED_RUN*3/4);
        }
        break;
    case Misc.preparing:
        charge_level=charge_level+World.delta_time_seconds;
        break;
    case Misc.attacking:
        if (distance_to_object(aggro_target)<64){
            we_sword();
            timer_evaluate_combat=room_speed;
        } else {
            timer_evaluate_combat=4*room_speed;
        }
        charge_level=0;
        combat_state=Misc.charging;
        break;
    case Misc.idle:
        // wait?
        break;
}
