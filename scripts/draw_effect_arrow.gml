xprevious=x;
yprevious=y;
zprevious=z;

var total_speed=point_distance_3d(0, 0, 0, xspeed, yspeed, zspeed)*World.delta_time_seconds;

//check if the ball will hit anything
// Originally written by Venomous in his Bullet implementation demo
if(c_raycast_world(x, y, z, x+xspeed*World.delta_time_seconds, y+yspeed*World.delta_time_seconds, z+zspeed*World.delta_time_seconds, COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (obj!=caster&&total_speed>5){ // arbitrary threshold
        //move the bullet to the hit location, and add a small offset to prevent it from jumping through geometry
        x=c_hit_x()+c_hit_nx();
        y=c_hit_y()+c_hit_ny();
        z=c_hit_z()+c_hit_nz();
        // make it stop
        xspeed=0;
        yspeed=0;
        zspeed=0;
        stopped=true;
        
        air_distance=point_distance_3d(xstart, ystart, zstart, x, y, z);
        air_speed=point_distance_3d(0, 0, 0, xspeed, yspeed, zspeed)*World.delta_time_seconds;
        
        var ad_result=air_distance/32*3;
        var at_result=speed_to_mph(air_speed);
        
        xstart=x;
        ystart=y;
        zstart=z;
        
        var base_damage=1;

        var f=12;
        
        with (obj){
            if (hit_flag_accept(c_hit_x(), c_hit_y())){
                script_execute(all_hit_scripts[on_hit], CombatTypes.pierce, other.caster, log2(total_speed)/f*other.strength+base_damage);
            } else {
                hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
            }
        }
    } else {
        x += xspeed*World.delta_time_seconds;
        y += yspeed*World.delta_time_seconds;
        z += zspeed*World.delta_time_seconds;
    }
} else {
    x += xspeed*World.delta_time_seconds;
    y += yspeed*World.delta_time_seconds;
    z += zspeed*World.delta_time_seconds;
}

if (!stopped){
    zspeed=zspeed+c_gravity*World.delta_time_seconds;
}

matrix(x, y, z, 0, 0, direction, 1, 1, 1);

d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_arrow].model_array[0], 0, 0, 0, tex_default, BASE_ASSET, World.mdl_arrow);

draw_reset_transform_stack();
