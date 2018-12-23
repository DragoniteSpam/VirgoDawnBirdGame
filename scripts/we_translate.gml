/// we_translate(x, y, z);

var r=8;

repeat(1+render_distance div 128){
    do {
        var xx=random_range(-r, r);
        var yy=random_range(-r, r);
        var zz=random_range(-r, r);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<r);
    var particle=instance_create(argument0+xx, argument1+yy, ParticleSpriteFace);
    particle.z=argument2+zz;
    particle.scale=0.2;
    particle.scalefactor=1.1;
    particle.alphafactor=0.9;
    particle.sprite_index=b_translate;
    particle.timer=room_speed/10;
}
