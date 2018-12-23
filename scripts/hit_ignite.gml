/// boolean hit_ignite(type, attacker, strength);

var attacker=argument1;
var strength=argument2;

if (timer_invincibility<=0){
    if (argument0&(CombatTypes.fire)){
        lit=true;
        return true;
    }
}

return false;
