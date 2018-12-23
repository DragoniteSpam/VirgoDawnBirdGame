xprevious=x;
yprevious=y;
zprevious=z;

x=x+move_speed*dcos(direction);
y=y-move_speed*dsin(direction);
z=z-move_speed*dsin(pitch);

var r=16;
repeat(1+render_distance div 64){
    do {
        var xx=random_range(-r, r);
        var yy=random_range(-r, r);
        var zz=random_range(-r, r);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<r);
    create_particle(RANDOM_PARTICLE_WARM, x+xx, y+yy, z+zz, 0, 0, 0, 0, 0, 0, 1, 240, 0, 0, 0);
}

if (c_raycast_world(xprevious, yprevious, zprevious, x, y, z, COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (obj!=caster){
        with (obj){
            if (hit_flag_accept(c_hit_x(), c_hit_y())){
                script_execute(all_hit_scripts[on_hit], CombatTypes.fire, other.caster, other.strength);
            } else {
                hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
            }
        }
        instance_destroy();
    }
}
