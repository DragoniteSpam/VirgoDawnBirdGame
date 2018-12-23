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
        if (point_distance_3d(x, y, z, aggro_target.x, aggro_target.y, aggro_target.z)<64){
            with (aggro_target){
                var f=1/16;
                var caster=ds_map_find_value(all_mod_packages, other.npc_package).my_npcs[other.npc_index].actor;
                if (hit_flag_accept(other.x, other.y)){
                    script_execute(all_hit_scripts[on_hit], CombatTypes.smash, caster, f, f);
                } else {
                    hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
                }
            }
        }
        break;
    case Misc.idle:
        break;
}
