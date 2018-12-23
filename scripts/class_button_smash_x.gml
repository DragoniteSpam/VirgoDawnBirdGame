/// void class_button_smash_x();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.press_x){
    Controller.press_x=false;
    if (World.ray_object!=noone){
        // smash thing here?
    }
}
