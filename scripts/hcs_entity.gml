if (xspeed!=0){
    if (c_overlap_world_position(c_collision, x+xspeed*World.delta_time_seconds, y, z+STEP_HEIGHT)==0){
        x+=xspeed*World.delta_time_seconds;
    }/* else {
        x=xprevious;
    }*/
}
if (yspeed!=0){
    if (c_overlap_world_position(c_collision, x, y+yspeed*World.delta_time_seconds, z+STEP_HEIGHT)==0){
        y+=yspeed*World.delta_time_seconds;
    }/* else {
        y=yprevious;
    }*/
}
