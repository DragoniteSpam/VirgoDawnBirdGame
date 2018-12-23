for (var i=0; i<ds_list_size(things); i++){
    var sel=things[| i];
    sel.loaded=false;
    if (sel.object!=noone){
        c_world_remove_object(sel.object);
    }
    instance_deactivate_object(sel);
}

loaded=false;
