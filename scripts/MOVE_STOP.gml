/// void MOVE_STOP([stop animation?]);

xspeed=0;
yspeed=0;
movement_state=MovementStates.still;

if (argument_count==0||argument[0]){
    frame=0;
}
