/// void class_button_fly_b();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.press_b&&lm.can_fly&&flight_flaps>0){
    zspeed=JUMP_HEIGHT;
    flight_flaps--;
    // Flapping your wings counts as a jump.
    stats_update_jumps();
}
