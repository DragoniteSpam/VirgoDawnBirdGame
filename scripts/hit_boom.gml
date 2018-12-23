/// boolean hit_boom(type, attacker, strength);

var damage=get_damage(argument1, id, argument0, argument2);

hp_current=max(0, hp_current-damage);

if (hp_current==0){
    DIE();
}
