xprevious=x;
yprevious=y;
zprevious=z;

if (target==noone){
    x=x+move_speed*dcos(direction);
    y=y-move_speed*dsin(direction);
    z=z-move_speed*dsin(pitch);
} else {
    if (instance_exists(target)){
        x=target.x+target_distance*dcos(target_direction);
        y=target.y-target_distance*dsin(target_direction);
        z=target.z+target_z;
    } else {
        instance_destroy();
    }
}

scale=sqrt(strength);

matrix_set(matrix_world, matrix_build(x, y, z, 0, 0, direction, scale, scale, scale));

d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_ice_spike].model_array[0], 0, 0, 0, -1, BASE_ASSET, World.mdl_ice_spike);

draw_reset_transform_stack();

if (c_raycast_world(xprevious, yprevious, zprevious, x, y, z, COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (obj!=caster){
        with (obj){
            if (hit_flag_accept(c_hit_x(), c_hit_y())){
                if (script_execute(all_hit_scripts[on_hit], CombatTypes.ice, other.caster, other.strength)){
                } else {
                    other.x=other.xprevious;
                    other.y=other.yprevious;
                    other.z=other.zprevious;
                    other.move_speed=0;
                    
                    other.target_direction=point_direction(x, y, other.x, other.y);
                    other.target_distance=point_distance(x, y, other.x, other.y);
                    other.target_z=other.z-z;
                    other.target=id;
                }
            } else {
                hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
            }
        }
        PLAY3D(se_ice, x, y, z, false);
    }
}
