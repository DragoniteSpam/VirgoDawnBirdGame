/// Weather get_current_weather();

var hash=(game_current_second+game_current_minute*3+game_current_hour*5+game_current_day*7+game_current_month*11)%256;

// @todo Find a better way to do this
return all_weather_types[WeatherTypes.clear];
//return all_weather_types[script_execute(all_environments[].weather_script, hash)];
