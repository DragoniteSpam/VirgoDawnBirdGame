/// boolean hit_flag_accept(x, y, z);
/**
 * What happens when you get hit from an invalid direction.
 * By default, sparks appear and the target gets stunned for a period of time.
 */

if (hit_flag_stun){
    combat_stun(x, y, z+16);
}

repeat(4+render_distance div 16){
    var dir=point_direction(x, y, argument0, argument1)+random_range(-10, 10);
    var spd=random_range(4, 8);
    var zspd=random_range(-2, 6);
    create_particle(ParticleColors.YELLOW, argument0, argument1, argument2, spd*dcos(dir), spd*dsin(dir), zspd, spd*dcos(dir), spd*dsin(dir), zspd, 1, 6, 0, 0, c_gravity);
}
