below=noone;
below_location_flag=LocationFlags.no;

if (movement_free()){
    c_object_set_mask(object, 0, 0);
    if (c_raycast_world(x, y, z+1, x, y, z-1, COLLISION_PRIMARY)){
        below=CollisionGetObject();
        below_location_flag=below.location_flag;
    }
    c_object_set_mask(object, mask, mask);
    if (Controller.ls_magnitude>0.1){
        movement_state=MovementStates.walking;
    } else if (movement_state==MovementStates.running){
        movement_state=MovementStates.walking;
    }
    var mspd=MOVE_SPEED_WALK;
    if (movement_state==MovementStates.walking){
        if ((Controller.run||auto_run)&&!(below_location_flag==LocationFlags.water||below_location_flag==LocationFlags.lava)){
            var mspd=(MOVE_SPEED_WALK+MOVE_SPEED_RUN);
            movement_state=MovementStates.running;
        }
    }
    mspd=mspd*get_class(Player.id).factor_top_speed*ternary(soaring, SOARING_COEFFICIENT, 1);
    if (soaring){
        World.horizontal_bar_separation=lerp(World.horizontal_bar_separation, H/4, 0.075);
    } else {
        World.horizontal_bar_separation=lerp(World.horizontal_bar_separation, H/2, 0.075);
    }
    World.horizontal_bar_separation=ceil(World.horizontal_bar_separation);
    
    if (Controller.rs){
        var max_distance=512;
        var min_distance=64;
        if (Controller.rup){
            Camera.distance=lerp(Camera.distance, max_distance, 0.025);
        } else if (Controller.rdown){
            Camera.distance=lerp(Camera.distance, min_distance, 0.025);
        }
    }

    script_execute(get_class(Player.id).on_press_a);
    script_execute(get_class(Player.id).on_press_b);
    script_execute(get_class(Player.id).on_press_x);
    script_execute(get_class(Player.id).on_press_y);
    script_execute(get_class(Player.id).on_press_start);
    
    // Potential movement
    
    if (Controller.ls_magnitude>0.1){
        switch (Camera.plane_2d){
            case CameraPlanes.xaxis:
                yspeed=0;
                if (Controller.left){
                    xspeed=-mspd;
                    direction=180;
                } else if (Controller.right){
                    xspeed=mspd;
                    direction=0;
                }
                break;
            case CameraPlanes.yaxis:
                xspeed=0;
                if (Controller.left){
                    yspeed=-mspd;
                    direction=90;
                } else if (Controller.right){
                    yspeed=mspd;
                    direction=270;
                }
                break;
        }
    }
    
    fade_target=0;
    
}

World.dbg_movement_state=movement_state;
World.dbg_xspeed=xspeed;
World.dbg_yspeed=yspeed;
World.dbg_zspeed=zspeed;
World.dbg_below=below;
