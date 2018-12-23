/// we_fire(x, y, z);

var r=2;

repeat(1+render_distance div 64){
    do {
        var xx=random_range(-r, r);
        var yy=random_range(-r, r);
        var zz=random_range(-r, r);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<r);
    var particle=create_particle(RANDOM_PARTICLE_WARM, argument0+xx, argument1+yy, argument2+zz, 0, 0, 0, 0, 0, 0, 0.5, 0, 0, 0, -c_gravity);
    particle.texture=-1;
    particle.timer=room_speed/10;
}
