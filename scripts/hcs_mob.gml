/// Just call hcs_entity for now, it's way easier

hcs_entity();

/*if (xspeed!=0){
    if (!c_sweep_world(shape, x, y, z+STEP_HEIGHT, x+xspeed*World.delta_time_seconds, y, z+STEP_HEIGHT, COLLISION_PRIMARY)){
        x=x+xspeed*World.delta_time_seconds;
    } else {
        x=c_hit_x()+c_hit_nx()*collision_r;
    }
}

if (yspeed!=0){
    if (!c_sweep_world(shape, x, y, z+STEP_HEIGHT, x, y+yspeed*World.delta_time_seconds, z+STEP_HEIGHT, COLLISION_PRIMARY)){
        y=y+yspeed*World.delta_time_seconds;
    } else {
        y=c_hit_y()+c_hit_ny()*collision_r;
    }
}*/
