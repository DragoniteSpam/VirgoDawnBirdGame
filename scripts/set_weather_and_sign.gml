var nearest=noone;
var dist=R2_32;

with (Location){
    var d=point_distance_3d(x, y, z, Player.x, Player.y, Player.z);
    if (d<dist){
        dist=d;
        nearest=id;
    }
}

if (nearest!=noone){
    if (nearest!=Player.location){
        Player.location=nearest;
        show_current_location();
        PLAY_AUTO();
    }
}

with (World){
    weather=get_current_weather();
    alarm[1]=weather_get_duration();
}
