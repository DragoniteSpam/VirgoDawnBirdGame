/// boolean hit_sproing(type, attacker, strength);

var attacker=argument1;
var strength=argument2;

if (argument0&(CombatTypes.sproing)){
    springy=true;
    var f=360*30;
    spring_time=0;
    spring_duration=f*strength;
}

return false;
