xprevious=x;
yprevious=y;
zprevious=z;

x=x+move_speed*dcos(direction);
y=y-move_speed*dsin(direction);
z=z-move_speed*dsin(pitch);

var r=4;

repeat(4+render_distance div 64){
    do {
        var xx=random_range(-r, r);
        var yy=random_range(-r, r);
        var zz=random_range(-r, r);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<r);
    var particle=instance_create(x+xx, y+yy, ParticleSpriteFace);
    particle.z=z+zz;
    particle.scale=scale;
    particle.scalefactor=scalefactor;
    particle.sprite_index=b_shove;
    particle.timer=room_speed/10;
}
