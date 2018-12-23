/// boolean validate_weather(string);

if (!string_starts_with(argument0, "Weather.")){
    return false;
}

var str=string_replace(argument0, "Weather.", "");

return (get_weather_from_name(str, -1)!=-1);
