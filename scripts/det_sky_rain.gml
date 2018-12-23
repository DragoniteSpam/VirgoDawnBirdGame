if (game_current_hour<4){
    return c_black;
}

var f=(game_current_minute/60)+(game_current_second/3600);

if (game_current_hour<6){
    return merge_colour(make_color_hsv(180, 255, 255*(game_current_hour+f-4)/2), c_blue, 0.5);
}

if (game_current_hour<8){
    return merge_colour(make_color_hsv(180-30*(game_current_hour+f-6), 255, 255), c_blue, 0.5);
}

if (game_current_hour<17){
    return merge_colour(make_color_hsv(120, 255, 255), c_blue, 0.5);
}

if (game_current_hour<19){
    return merge_colour(make_color_hsv(120+30*(game_current_hour+f-17), 255, 255), c_blue, 0.5);
}

if (game_current_hour<21){
    return merge_colour(make_color_hsv(180, 255, 255-255*(game_current_hour+f-19)/2), c_blue, 0.5);
}
