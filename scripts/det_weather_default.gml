/// Weather def_weather_default(byte: hash);

// Turn off for testing stuff

return WeatherTypes.clear;

// 1 in 16 chance of raining

switch (argument0%16){
    case 0:
        return WeatherTypes.rain;
    default:
        return WeatherTypes.clear;
}
