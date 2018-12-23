if (game_current_hour<4){
    return c_black;
}

var f=(game_current_minute/60)+(game_current_second/3600);
var sat=scaleTo(40, 100, 255);

if (game_current_hour<6){
    return make_color_hsv(180, sat, 255*(game_current_hour+f-4)/2);
}

if (game_current_hour<8){
    return make_color_hsv(180-30*(game_current_hour+f-6), sat, 255);
}

if (game_current_hour<17){
    return make_color_hsv(120, sat, 255);
}

if (game_current_hour<19){
    return make_color_hsv(120+30*(game_current_hour+f-17), sat, 255);
}

if (game_current_hour<21){
    return make_color_hsv(180, sat, 255-255*(game_current_hour+f-19)/2);
}
