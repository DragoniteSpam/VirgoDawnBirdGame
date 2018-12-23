/// void scr_turn(ArgSet);
/* causes an Actor to start turning (zrotspeed)
 * similar to scr_face, but not instantaneous
 * syntax (in the const_npc thing):
 *  scr_turn, NPC, speed, target, absolute?
 * Arguments:
 *   - double speed: the speed at which to turn
 *   - double target: the target angle
 *   - boolean absolute: whether to turn an exact amount or a relative amount
 */

zrotspeed=eval(argument0[| 0].value);

if (argument0[| 2].value){
    zrottarget=eval(argument0[| 1].value);
} else {
    zrottarget=(actor.direction+eval(argument0[| 2].value)+360)%360;
}

World.keep_going=true;
