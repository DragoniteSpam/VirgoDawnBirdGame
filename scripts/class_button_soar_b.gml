/// void class_button_soar_b();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.b&&!Controller.a&&Player.below_location_flag==LocationFlags.no){
    Player.soaring=true;
    Player.frame=0;
}
