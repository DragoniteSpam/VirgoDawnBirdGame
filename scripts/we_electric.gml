/// we_electric(x, y, z);

var r=8;

repeat(1+render_distance div 128){
    do {
        var xx=random_range(-r, r);
        var yy=random_range(-r, r);
        var zz=random_range(-r, r);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<r);
    var particle=create_particle(0, argument0+xx, argument1+yy, argument2+zz, 0, 0, 0, 0, 0, 0, 0.6, 0, 0, 0, 0, Models.part_lightning);
    particle.texture=-1;
    particle.scalefactor=0.9;
    particle.timer=room_speed/10;
}
