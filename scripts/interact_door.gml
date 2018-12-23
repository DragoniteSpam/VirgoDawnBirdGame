/// boolean interact_door();
// Returns true if successful.

if (boolean_flags[flag, BF_VALUE]==LOCKED){
    if (lock_item>0){
        if (HasItem(lock_item_package, lock_item)){
            boolean_flags[lock_index, BF_VALUE]=UNLOCKED;
            AddNotification(get_text(Text.utilUnlockedDoor)+' '+ds_map_find_value(all_mod_packages, lock_item_package).my_items[lock_item].name+'.');
        }
    }
    return false;
}

if (state==Misc.open){
    state=Misc.closed;
    if (swing_direction==Misc.counterclockwise){
        target_direction=(target_direction+270)%360;
    } else {
        target_direction=(target_direction+90)%360;
    }
    PLAY3D(se_door_close, x, y, z, false);
} else {
    state=Misc.open;
    if (swing_direction==Misc.clockwise){
        target_direction=(target_direction+270)%360;
    } else {
        target_direction=(target_direction+90)%360;
    }
    PLAY3D(se_door_open, x, y, z, false);
}

// Change the angle for collision right here, instantaneously
var dir=direction;
direction=target_direction;
CollisionObjectTransform(id);
direction=dir;

return true;
