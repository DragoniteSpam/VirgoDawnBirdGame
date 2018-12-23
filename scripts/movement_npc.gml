if (turning_is_random&&irandom(turn_frequency)==0&&World.cutscene==noone){
    direction=irandom(359);
}

// this may be more trouble than it's worth

if (aggro_target!=noone){
    if (bleedout){
    } else {
        script_execute(all_combat_ai_types[combat_type].script_step);
    }
} else if (aggro_level==Aggro.mad){
    set_aggro_target(Player.id);
} else if (movement_is_random&&following==noone){
    // Too far, stop and turn around
    if (point_distance(x, y, xstart, ystart)>movement_radius){
        var xnew=x+xspeed*World.delta_time_seconds;
        var ynew=y+yspeed*World.delta_time_seconds;
        if (point_distance(xstart, ystart, xnew, ynew)>point_distance(xstart, ystart, x, y)){
            MOVE_STOP();
        } else if (irandom(movement_frequency)==0){
            direction=point_direction(x, y, xstart, ystart)+irandom(30)-15;
            MOVE_WALK(direction, MOVE_SPEED_WALK);
        }
    // Within bounds, walk wherever you feel like
    } else if (irandom(60)==0){
        MOVE_STOP();
    } else {
        if (irandom(movement_frequency)==0){
            direction=irandom(359);
            MOVE_WALK(direction, MOVE_SPEED_WALK);
        }
    }
    if (movement_state==MovementStates.walking&&irandom(240)==60){
        direction=irandom(359);
    }
} else if (following!=noone){
    // this will only work if autonomous movement is turned off
    var dist=distance_to_object(following);
    // State: too far away
    if (dist>AI_FOLLOWER_DISTANCE_LIMIT){
        if (following==Player.id||following==Player){
            if (point_distance(following.x, following.y, x, y)>AI_FOLLOWER_DISTANCE_LIMIT&&irandom(10)<2){
                with (instance_create(0, 0, NotificationBabble)){
                    text=get_text(Text.utilWaitUp);
                }
            }
        }
        var d=point_direction(following.x, following.y, x, y);
        var dist=point_distance(x, y, following.x, following.y)/2;
        x=following.x+dist*dcos(d);
        y=following.y-dist*dsin(d);
        z=following.z+1000;
        editor_floor_object(id);
        CollisionObjectTransform(id);
    // State: can walk towards you
    } else if (dist>AI_FOLLOWER_DISTANCE_MIN){
        // if you're far enough that you have to move, or you just decide to on your own
        if (dist>AI_FOLLOWER_DISTANCE_MAX||irandom(100)<5){
            direction=point_direction(x, y, following.x, following.y)+irandom(30)-15;
            MOVE_WALK(direction, MOVE_SPEED_RUN);
        // If you're walking and you're within the tolerance range, there's a random chance to stop
        } else if (movement_state==MovementStates.walking){
            if (irandom(120)==60){
                MOVE_STOP();
            }
        }
    // State: too close
    } else {
        MOVE_STOP();
        if (irandom(120)==60){
            direction=point_direction(x, y, following.x, following.y)+irandom(30)-15;
        }
    }
}

//////////////////////////////////
/////////// ANIMATIONS ///////////
//////////////////////////////////

anim_cast_t+=anim_cast_rate;
if (anim_cast_t>=ds_map_find_value(all_mod_packages, equip_weapon_package).my_items[equip_weapon].weapon_anim_steps){
    anim_cast_t=0;
    anim_cast_rate=0;
}
