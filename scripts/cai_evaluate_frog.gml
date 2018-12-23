switch (combat_state){
    case Misc.charging:
        var range_min=32;
        var range_max=96;
        var dir=point_direction(x, y, aggro_target.x, aggro_target.y);
        var dist=point_distance(x, y, aggro_target.x, aggro_target.y);
        if (dist<range_min){
            MOVE_WALK(dir+180, MOVE_SPEED_RUN*3/4);
            zspeed=JUMP_HEIGHT;
            timer_evaluate_combat=choose(room_speed, room_speed/2, room_speed/4);
        } else if (dist>range_max){
            MOVE_WALK(dir, MOVE_SPEED_RUN*3/4);
            zspeed=JUMP_HEIGHT;
            timer_evaluate_combat=choose(room_speed, room_speed/2, room_speed/4);
        } else {
            if (choose(1, 2, 3)==1){
                MOVE_STOP();
                zspeed=JUMP_HEIGHT*4;
                combat_state=Misc.preparing;
                timer_evaluate_combat=-2*zspeed/c_gravity+1;
            } else {
                MOVE_WALK(dir+random_range(-90, 90), MOVE_SPEED_RUN*3/4);
                timer_evaluate_combat=choose(room_speed, room_speed/2, room_speed/4);
            }
        }
        direction=dir;
        gravity_force=true;
        break;
    case Misc.preparing:
        combat_state=Misc.attacking;
        direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        break;
    case Misc.attacking:
        direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        break;
    case Misc.idle:
        break;
}
