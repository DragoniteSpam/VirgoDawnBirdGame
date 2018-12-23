/// Weather det_weather_fog(byte: hash);

// 1 in 16 chance of raining, 8 in 16 chance of fog

switch (argument0%16){
    case 0:
        return WeatherTypes.rain;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
        return WeatherTypes.fog;
    default:
        return WeatherTypes.clear;
}
