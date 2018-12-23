/// Color get_sky_color();

with (World){
    if (lm.is_indoors){
        return c_black;
    }
    return script_execute(weather.sky_color);
}
