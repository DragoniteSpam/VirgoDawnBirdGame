switch (combat_state){
    case Misc.charging:
        var range_min=128;
        var dir=point_direction(x, y, aggro_target.x, aggro_target.y);
        var dist=point_distance(x, y, aggro_target.x, aggro_target.y);
        if (dist<range_min&&random(8)<2){
            combat_state=Misc.preparing;
            timer_evaluate_combat=choose(room_speed, room_speed/2, room_speed/4);
        } else /*if (dist>range_max)*/{
            MOVE_WALK(dir, MOVE_SPEED_RUN*3/4);
            zspeed=JUMP_HEIGHT;
            timer_evaluate_combat=choose(room_speed, room_speed/2, room_speed/4);
        } /*else {
            if (choose(1, 2, 3)==1){
                MOVE_STOP();
                combat_state=Misc.preparing;
                timer_evaluate_combat=-2*zspeed/c_gravity+1;
            } else {
                MOVE_WALK(dir, MOVE_SPEED_RUN*3/4);
                timer_evaluate_combat=choose(room_speed, room_speed/2, room_speed/4);
            }
        }*/
        direction=dir;
        gravity_force=true;
        break;
    case Misc.preparing:
        combat_state=Misc.attacking;
        direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        MOVE_WALK(direction, MOVE_SPEED_RUN*4);
        zspeed=JUMP_HEIGHT;
        c_object_set_mask(object, 0, 0);
        timer_evaluate_combat=room_speed;
        break;
    case Misc.attacking:
//        direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        combat_state=Misc.idle;
        timer_evaluate_combat=room_speed*2;
        c_object_set_mask(object, mask, mask);
        var confusion=create_confusion(x, y, z+16);
        confusion.timer=room_speed*6;
        ds_list_add(attached_particles, confusion);
        break;
    case Misc.idle:
        combat_state=Misc.charging;
        timer_evaluate_combat=room_speed*4;
        break;
}
