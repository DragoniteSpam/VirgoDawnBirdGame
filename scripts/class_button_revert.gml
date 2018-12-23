/// void class_button_pause();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.press_start){
    Controller.press_start=false;
    set_class(Classes.Person);
}
