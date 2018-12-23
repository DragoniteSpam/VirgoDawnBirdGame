/// boolean get_release_select();
// Literally all it does is check for the Select button, and then unset it.

var a=Controller.release_select;
Controller.release_select=false;

return a;
