/// reflexive SetWeather(shader index);

with (World){
    weather=all_weather_types[argument0];
    alarm[1]=weather_get_duration();
}

return argument0;
