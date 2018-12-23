/// Weather add_weather(internal name, name, light color, sky color, covers ground?, sun scale, fog start scaler, fog end scaler, weather script, intensity, show stars);

with (instantiate(Weather)){
    internal_name=argument0;
    name=argument1;
    light_color=argument2;
    sky_color=argument3;
    cover_ground=argument4;
    sun_scale=argument5;
    fog_start=argument6*FOG_DEFAULT_START;
    fog_end=argument7*FOG_DEFAULT_END;
    script=argument8;
    intensity=argument9;
    show_stars=argument10;
    
    return id;
}
