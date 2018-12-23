/// boolean get_press_x();
// Literally all it does is check for the X button, and then unset it.

var a=Controller.press_x;
Controller.press_x=false;

return a;
