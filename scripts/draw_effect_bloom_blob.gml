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
    particle.scale=0.2;
    particle.scalefactor=0.9;
    particle.sprite_index=b_bloom;
    particle.timer=room_speed/10;
}

if (c_raycast_world(xprevious, yprevious, zprevious, x, y, z, COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (obj!=caster){
        with (obj){
            if (hit_flag_accept(c_hit_x(), c_hit_y())){
                script_execute(all_hit_scripts[on_hit], CombatTypes.grow, other.caster, other.strength);
            } else {
                hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
            }
        }
        instance_destroy();
    }
}
