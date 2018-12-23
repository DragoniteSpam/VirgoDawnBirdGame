xprevious=x;
yprevious=y;
zprevious=z;

x=x+move_speed*dcos(direction);
y=y-move_speed*dsin(direction);
z=z-move_speed*dsin(pitch);

var r=sqrt(strength)*16;

repeat(4+render_distance/64){
    do {
        var xx=random_range(-r, r);
        var yy=random_range(-r, r);
        var zz=random_range(-r, r);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<r);
    var particle=instance_create(x+xx, y+yy, ParticleSpriteFace);
    particle.z=z+zz;
    particle.scale=0.2;
    particle.scalefactor=0.9;
    particle.sprite_index=b_heal;
    particle.alarm[0]=room_speed/10;
}
