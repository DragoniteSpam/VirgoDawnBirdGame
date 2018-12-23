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
        switch (difficulty){
            case DifficultyModes.noob:
            case DifficultyModes.easy:
            case DifficultyModes.regular:
                spell=choose(CombatTypes.electric, CombatTypes.fire, CombatTypes.ice);
                var miss=24;
                break;
            case DifficultyModes.hard:
            case DifficultyModes.masochist:
                var damage_electric=get_damage(id, aggro_target, CombatTypes.electric, 1);
                var damage_fire=get_damage(id, aggro_target, CombatTypes.fire, 1);
                var damage_ice=get_damage(id, aggro_target, CombatTypes.ice, 1);
                if (damage_electric==max(damage_electric, damage_fire, damage_ice)){
                    spell=CombatTypes.electric;
                } else if (damage_fire==max(damage_electric, damage_fire, damage_ice)){
                    spell=CombatTypes.fire;
                } else {
                    spell=CombatTypes.ice;
                }
                var miss=12;
                break;
        }

        if (hp_current<0.35*get_max_hp(exp_hp)){
            if (can_heal){
                var chance;
                switch (difficulty){
                    case DifficultyModes.noob:
                        chance=2;
                        break;
                    case DifficultyModes.easy:
                        chance=5;
                        break;
                    case DifficultyModes.regular:
                        chance=10;
                        break;
                    case DifficultyModes.hard:
                        chance=20;
                        break;
                    case DifficultyModes.masochist:
                        chance=35;
                        break;
                }
                if (random(100)<chance){
                    spell=CombatTypes.heal;
                }
            }
        }
        var scr=combat_type_attacks[spell];
        script_execute(scr, x, y, z+EYE_LEVEL, point_direction(x+random_range(-miss, miss), y+random_range(-miss, miss), aggro_target.x, aggro_target.y),
            darctan((z+random_range(-miss, miss)-aggro_target.z)/distance_to_object(aggro_target)), charge_level, id);
        charge_level=0;
        combat_state=Misc.charging;
        timer_evaluate_combat=room_speed;
        break;
    case Misc.idle:
        // wait?
        break;
}
