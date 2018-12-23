/// boolean hit_teleport(type, attacker, strength);

var attacker=argument1;
var strength=argument2;

if (argument0&(CombatTypes.teleport)){
    interact_character();
}

return false;
