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
    // Camera look/rotation in 3 dimensions
    Camera.direction=movement_get_direction(Camera.direction);
    Camera.pitch=movement_get_pitch(Camera.pitch);
    if (Controller.ls_magnitude>0.1||Controller.press_a||Controller.press_b||Controller.press_x||Controller.press_y||Camera.pov==CameraPOV.cam_first){
        direction=Camera.direction;
    }
    pitch=Camera.pitch;
    
    if (get_press_rs()){
        camera_swap_pov();
    }
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
        var d=direction+Controller.ls_angle-90;
        xspeed=dcos(d)*mspd;
        yspeed=-dsin(d)*mspd;
    }
    
    fade_target=0;
    
    if (Controller.press_rs){
        if (Camera.pov==CameraPOV.cam_third){
            Camera.pov=CameraPOV.cam_first;
        } else if (Camera.pov==CameraPOV.cam_first){
            Camera.pov=CameraPOV.cam_third;
        }
    }
    // This is now handled in movement()
    /*if (below_location_flag==LocationFlags.water&&abs(xspeed)>0&&abs(yspeed)>0&&World.frames%20==0){
        create_water_ring(x, y, z, 0.25);
    }*/
} else if (!Player.cutscene_lock){
    var rs_x=gamepad_axis_value(0, gp_axisrh)+clamp((MOUSE_X-WW/2)/10, -1, 1);
    centerCursor();
    World.display_cursor=false;
    World.cursor_is_free=false;
    draw_cursor_auto();
    var t=Controller.rs_x;
    Controller.rs_x=rs_x;
    var d=movement_get_direction(direction);
    Controller.rs_x=t;
    direction=(d+360)%360;
}
World.dbg_movement_state=movement_state;
World.dbg_xspeed=xspeed;
World.dbg_yspeed=yspeed;
World.dbg_zspeed=zspeed;
World.dbg_below=below;
