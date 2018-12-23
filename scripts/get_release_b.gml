/// boolean get_release_b();
// Literally all it does is check for the B button, and then unset it.

var a=Controller.release_b;
Controller.release_b=false;

return a;
