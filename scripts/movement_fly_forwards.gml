if (animation_t==-1){
    animation_t=World.frames;
}

var local_t=World.frames-animation_t;

if (local_t%10==0){
    zspeed=JUMP_HEIGHT;
}

xspeed=MOVE_SPEED_RUN*dcos(direction);
yspeed=-MOVE_SPEED_RUN*dsin(direction);
