/// boolean hit_destroy_large(type, attacker, strength);

var attacker=argument1;
var strength=argument2;

if (timer_invincibility<=0){
    if (argument0&(CombatTypes.electric|CombatTypes.fire|CombatTypes.smash|CombatTypes.boom|CombatTypes.pierce)){
        var damage=get_damage(argument1, id, argument0, argument2);
        hp_current=max(0, hp_current-damage);
        if (hp_current==0){
            repeat(32+render_distance div 2){
                (create_particle(0, x, y, z, -120, -120, 240, 120, 120, 360, random_range(1, 2), 240, 0, 0, c_gravity, Models.part_wood)).texture=tex_default;
            }
            set_alive(false);
            
            return true;
        }
    } else if (argument0&CombatTypes.shove){
        // do nothing, these are too big to push
    }
}

return false;
