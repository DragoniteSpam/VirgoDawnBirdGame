enum WeatherTypes {
    clear,
    rain,
    heavyrain,
    snow,
    blizzard,
    hail,
    sun,
    strongsun,
    sand,
    darkness,
    totaldarkness,
    fog,
    thickfog,
}

globalvar all_weather_types;

all_weather_types=array_add(WeatherTypes.thickfog);

all_weather_types[WeatherTypes.clear]=add_weather('Clear', "Clear", c_white, det_sky_default, false, 1, 10, 1, scr_weather_clear, 480, true);
all_weather_types[WeatherTypes.rain]=add_weather('Rain', "Rain", c_white, det_sky_rain, false, 0.8, 8, 0.75, scr_weather_rain, 960, false);
all_weather_types[WeatherTypes.heavyrain]=add_weather('HeavyRain', "Heavy Rain", c_white, det_sky_rain, false, 0.4, 6, 0.5, scr_weather_rain2, 64*60, false);
all_weather_types[WeatherTypes.snow]=add_weather('Snow', "Snow", c_gray, det_sky_snow, true, 0.9, 9, 0.25, scr_weather_snow, 120, false);
all_weather_types[WeatherTypes.blizzard]=add_weather('Blizzard', "Blizzard", c_gray, det_sky_snow, true, 0.8, 8, 0.125, scr_weather_blizzard, 128*60, false);
all_weather_types[WeatherTypes.hail]=add_weather('Hail', "Hail", c_gray, det_sky_snow, true, 0.9, 10, 0.6, scr_weather_hail, 960, false);
all_weather_types[WeatherTypes.sun]=add_weather('Sun', "Sun", c_yellow, det_sky_default, false, 1.5, 16, 1.5, scr_weather_sun, 360, true);
all_weather_types[WeatherTypes.strongsun]=add_weather('StrongSun', "Strong Sun", c_yellow, det_sky_default, false, 2, 20, 2, scr_weather_sun2, 480, true);
all_weather_types[WeatherTypes.sand]=add_weather('Sand', "Sand", merge_colour(c_brown, c_yellow, 0.5), det_sky_sand, false, 0.9, 90, 0.5, scr_weather_sand, 128*60, false);
all_weather_types[WeatherTypes.darkness]=add_weather('Darkness', "Darkness", c_white, det_sky_dark, false, 0, 10, 0.1, scr_weather_fog, 480, true);
all_weather_types[WeatherTypes.totaldarkness]=add_weather('TotalDarkness', "Total Darkness", c_gray, det_sky_dark, false, 0, 10, 0.05, scr_weather_fog, 480, true);
all_weather_types[WeatherTypes.fog]=add_weather('Fog', "Fog", c_white, det_sky_snow, false, 0.5, 10, 0.5, scr_weather_fog, 480, false);
all_weather_types[WeatherTypes.thickfog]=add_weather('ThickFog', "Thick Fog", c_white, det_sky_snow, false, 0.5, 10, 0.2, scr_weather_fog, 480, false);
