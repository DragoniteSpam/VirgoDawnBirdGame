xprevious=x;
yprevious=y;
zprevious=z;

var total_speed=point_distance_3d(0, 0, 0, xspeed, yspeed, zspeed)*World.delta_time_seconds;

//check if the ball will hit anything
// Originally written by Venomous in his Bullet implementation demo\
if(c_raycast_world(x, y, z, x+xspeed*World.delta_time_seconds, y+yspeed*World.delta_time_seconds, z+zspeed*World.delta_time_seconds, COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (obj!=caster){
        //move the bullet to the hit location, and add a small offset to prevent it from jumping through geometry
        x=c_hit_x()+c_hit_nx();
        y=c_hit_y()+c_hit_ny();
        z=c_hit_z()+c_hit_nz();
            
        //make it bounce
        var nx=c_hit_nx()+random_range(-0.1, 0.1);
        var ny=c_hit_ny()+random_range(-0.1, 0.1);
        var nz=c_hit_nz()+random_range(-0.1, 0.1);
        var dot=dot_product_3d(xspeed, yspeed, zspeed, nx, ny, nz);
        xspeed=(-2*dot*nx+xspeed)*0.4;
        yspeed=(-2*dot*ny+yspeed)*0.4;
        zspeed=(-2*dot*nz+zspeed)*0.4;
        
        air_distance=point_distance_3d(xstart, ystart, zstart, x, y, z);
        air_speed=point_distance_3d(0, 0, 0, xspeed, yspeed, zspeed)*World.delta_time_seconds;
        
        var ad_result=air_distance/32*3;
        var at_result=speed_to_mph(air_speed);
        
        xstart=x;
        ystart=y;
        zstart=z;
        
        if (total_speed>4){
            direction=random(360);
            pitch=random(360);
            roll=random(360);
        } else {
            create_explosion(x, y, z+64, 160, caster);
            instance_destroy();
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

zspeed=zspeed+c_gravity;

var matrix_a=matrix_build(0, 0, 0, pitch, roll, 0, 1, 1, 1)
var matrix_b=matrix_build(x, y, z, 0, 0, point_direction(0, 0, xspeed, yspeed)+90, 1, 1, 1);
var matrix_new=matrix_multiply(matrix_a, matrix_b);
matrix_set(matrix_world, matrix_multiply(matrix_new, matrix_get(matrix_world)));

d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_football].model_array[0], 0, 0, 0, tex_default, BASE_ASSET, World.mdl_football);

draw_reset_transform_stack();
