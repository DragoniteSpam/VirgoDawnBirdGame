if (boolean_flags[lock_index, BF_VALUE]==LOCKED){
/*    var prospective=HasItemKey(flag);
    if (prospective==noone){
        var msg=boolean_flags[flag, BF_LOCK_MSG];
        if (msg==''){
            return get_text(Text.worldDoorIsLocked);
        }
        return msg;
    } else {
        return get_text(Text.worldDoorUnlocked)+' '+all_items[prospective.index].name+'.';
    }*/
    
    // @todo rewrite this once you figure out what it's supposed to do
}

return get_text(Text.worldDoor);
