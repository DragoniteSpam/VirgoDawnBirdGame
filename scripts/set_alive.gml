/// void set_alive(alive?, [live mask]);

alive=argument[0];

if (alive){
    if (argument_count>1){
        mask=argument[1];
    } else if (instanceof(Event)){
        mask=COLLISION_EVENT_DEFAULT;
    } else {
        mask=COLLISION_PRIMARY_DEFAULT;
    }
} else {
    mask=COLLISION_DEAD_DEFAULT;
}

c_object_set_mask(object, mask, mask);
