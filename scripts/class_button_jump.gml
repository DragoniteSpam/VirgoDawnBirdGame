/// void class_button_jump();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.y&&location_flag_can_jump[below_location_flag]){
    zspeed=JUMP_HEIGHT*World.cam_pov_jump_factor[Camera.pov];
    stats_update_jumps();
}
