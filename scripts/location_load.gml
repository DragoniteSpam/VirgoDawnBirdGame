for (var i=0; i<ds_list_size(things); i++){
    var sel=things[| i];
    sel.loaded=true;
    if (sel.object!=noone){
        c_world_add_object(sel.object);
        CollisionObjectTransform(sel);
    }
    instance_activate_object(sel);
    with (sel){
        script_execute(on_reload);
    }
}

loaded=true;
