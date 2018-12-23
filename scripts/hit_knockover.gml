/// boolean hit_ignite(type, attacker, strength);

var attacker=argument1;
var strength=argument2;
var turn_target=45;
var turn_speed=180;

if (timer_invincibility<=0){
    if (argument0&(CombatTypes.shove)){
        PLAY(se_bang, false);
        // Wouldn't have to do this if I'd done the hit code properly . . .
        if (instanceof(EntityCauldronK)&&!looted){
            xrottarget=turn_target;
            xrotspeed=turn_speed;
            // it's +1 to let the last "frame" "animate" before the game halts it
            timer_knockover=(turn_target/turn_speed)+1;
            looted=true;
        }
        return true;
    }
}

return false;
