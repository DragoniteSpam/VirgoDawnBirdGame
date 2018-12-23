/// void land_sproing(Entity);

if (springy){
    var dx=sproing_target_x-argument0.x;
    var dy=sproing_target_y-argument0.y;
    
    var v0=sqrt(-2*c_gravity*sproing_target_height);    // This works and i have no idea why
    var air_time=abs(v0/c_gravity);
    
    var f=ternary(sproing_equation==Misc.sproing_eq_2, 2, 4);
    argument0.xspeed=dx/(f*air_time*World.delta_time_seconds);
    argument0.yspeed=dy/(f*air_time*World.delta_time_seconds);
    argument0.zspeed=v0;
}
