/// boolean interact_door_password();
// Returns true if successful.

if (boolean_flags[flag, BF_VALUE]==LOCKED){
    interact_character();
    return false;
}

return interact_door();
