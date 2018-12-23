switch (combat_state){
    case Misc.begin_combat:
        var dir=point_direction(x, y, Player.x, Player.y)+180;
        MOVE_WALK(dir, MOVE_SPEED_RUN);
        zspeed=JUMP_HEIGHT;
        timer_evaluate_combat=room_speed/3;
        combat_state=Misc.charging;
        gravity_force=true;
        break;
    case Misc.charging:
        break;
    case Misc.preparing:
        break;
    case Misc.attacking:
        charge_level_d=World.delta_time_seconds;
        if (charge_level>=(1-charge_level_d)){
            combat_state=Misc.charging;
            timer_evaluate_combat=room_speed/2;
        }
        combat_weapon_execute();
        break;
    case Misc.idle:
        // wait?
        break;
}
