/// boolean get_press_y();
// Literally all it does is check for the Y button, and then unset it.

var a=Controller.press_y;
Controller.press_y=false;

return a;
