/// boolean hit_destroy_small(type, attacker, strength);

var attacker=argument1;
var strength=argument2;

if (timer_invincibility<=0){
    if (argument0&(CombatTypes.electric|CombatTypes.fire|CombatTypes.smash|CombatTypes.boom|CombatTypes.pierce)){
        var damage=get_damage(argument1, id, argument0, argument2);
        hp_current=max(0, hp_current-damage);
        if (hp_current==0){
            repeat(16+render_distance div 4){
                (create_particle(0, x, y, z, -120, -120, 240, 120, 120, 360, random_range(1, 2), 240, 0, 0, c_gravity, Models.part_wood)).texture=tex_default;
            }
            DIE(attacker, DeathTypes.death_mob);
            return true;
        }
    } else if (argument0&CombatTypes.shove){
        var dir=point_direction(attacker.x, attacker.y, x, y);
        xspeed=strength*120*dcos(dir);
        yspeed=-strength*120*dsin(dir);
        return true;
    }
}

return false;
