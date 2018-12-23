with (World){
    game_current_second=game_current_second+argument0;
    if (game_current_second>=60){
        game_clock_update_minute(game_current_second div 60);
        game_current_second=game_current_second%60;
    }
    // Shooting stars
    if (day_era==Daytimes.night&&!lm.is_indoors){
        if (irandom(1500)==10){
            var xa=Camera.x;
            var ya=Camera.y;
            var radius=point_distance(xa, ya, 0, 0)+512;
            var h=1024;             // distance above camera
            var time=3+irandom(2);  // seconds to fall
            var angle=random(2*pi);
            var xb=xa+radius*cos(angle);
            var yb=ya-radius*sin(angle);
            var comet=instance_create(xa, ya, Comet);
            comet.z=Camera.z+h;
            comet.zspeed=-(Camera.z+h)/time;
            comet.xspeed=(xb-xa)/time;
            comet.yspeed=(yb-ya)/time;
        }
    }
    // Process Location un/loading
    if (!game_mode_is_debug[mode]){
        with (Location){
            if (point_distance_3d(x, y, z, Player.x, Player.y, Player.z)<radius_load){
                if (!loaded){
                    location_load();
                }
            } else {
                if (loaded){
                    location_unload();
                }
            }
        }
    }
}
