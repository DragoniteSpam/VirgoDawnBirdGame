switch (combat_state){
    case Misc.charging:
        direction=point_direction(x, y, aggro_target.x, aggro_target.y);
        var distance=point_distance_3d(x, y, z, aggro_target.x, aggro_target.y, aggro_target.z);
        c_object_set_mask(object, 0, 0);
        if (!c_raycast_world(x, y, z+EYE_LEVEL, aggro_target.x, aggro_target.y, aggro_target.z+EYE_LEVEL, COLLISION_PRIMARY)||CollisionGetObject()==aggro_target){
            MOVE_STOP();
            switch (difficulty){
                case DifficultyModes.noob:
                case DifficultyModes.easy:
                case DifficultyModes.regular:
                    combat_state=Misc.idle;
                    break;
                case DifficultyModes.hard:
                case DifficultyModes.masochist:
                    combat_state=Misc.preparing;
                    break;
            }
        }
        c_object_set_mask(object, mask, mask);
        timer_evaluate_combat=room_speed/4;
        break;
    case Misc.preparing:
        combat_state=Misc.attacking;
        break;
    case Misc.attacking:
        break;
    case Misc.idle:
        combat_state=Misc.preparing;
        timer_evaluate_combat=room_speed/4;
        break;
}
