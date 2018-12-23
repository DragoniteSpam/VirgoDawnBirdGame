var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_turn_to_face, -1, NPCs.ActivePlayer));
ds_list_add(l, args(scr_set_multi_option, "Clear Skies", 0, "Rain", 1, "Heavy Rain", 2, "Snow", 3,
    "Blizzard", 4, "Hail", 5, "Sandstorm", 6));
ds_list_add(l, args(scr_set_multi_option_more, "Sun", 7, "Strong Sun", 8, "Fog", 9, "Thick Fog", 10,
    "Darkness", 11, "Total Darkness", 12));
ds_list_add(l, args(scr_talk, "I'm a weatherman! What would you like the weather to look like today?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_weather, WeatherTypes.clear));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_weather, WeatherTypes.rain));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_weather, WeatherTypes.heavyrain));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 3, scr_weather, WeatherTypes.snow));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 4, scr_weather, WeatherTypes.blizzard));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 5, scr_weather, WeatherTypes.hail));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 6, scr_weather, WeatherTypes.sand));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 7, scr_weather, WeatherTypes.sun));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 8, scr_weather, WeatherTypes.strongsun));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 9, scr_weather, WeatherTypes.fog));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 10, scr_weather, WeatherTypes.thickfog));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 11, scr_weather, WeatherTypes.darkness));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 12, scr_weather, WeatherTypes.totaldarkness));
ds_list_add(l, args(scr_lock_unset));

return l;
