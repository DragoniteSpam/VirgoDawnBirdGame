/// void stats_update_walked(xspeed, yspeed);

if (id==Player.id){
    stat_distance_walked=stat_distance_walked+point_distance(0, 0, xspeed*World.delta_time_seconds, yspeed*World.delta_time_seconds)/32;
}
