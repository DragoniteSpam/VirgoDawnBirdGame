/// void class_button_cast_electric_b();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.b){
    Player.active_class_charge_level=Player.active_class_charge_level+1/room_speed;
}

if (Controller.release_b&&!Controller.a&&Player.anim_cast_rate==0){
    // 180/number of frames to animation completion
    Player.anim_cast_rate=180/30;
    create_ball_lightning(Camera.x, Camera.y, Camera.z, Camera.direction, Camera.pitch, Player.active_class_charge_level);
    Player.active_class_charge_level=0;
}
