enum Maps {
    charity,
    chastity,
    diligence,
    humility,
    kindness,
    patience,
    temperence,
    cave,
    final
}

globalvar lm, weather;

var arr=array_create(Maps.final);

lm=noone;
weather=all_weather_types[WeatherTypes.clear];

arr[Maps.charity]=add_map('Charity', "Charity", "charity", true, true, BooleanFlags.HasVisitedPatience, RD_NEAR, true, false, Maps.charity);
arr[Maps.chastity]=add_map('Chastity', "Chastity", "chastity", false, true, BooleanFlags.HasVisitedChastity, RD_FAR, true, false, Maps.chastity);
arr[Maps.diligence]=add_map('Diligence', "Diligence", "diligence", true, true, BooleanFlags.HasVisitedPatience, RD_NEAR, true, false, Maps.diligence);
arr[Maps.humility]=add_map('Humility', "Humility", "humility", true, true, BooleanFlags.HasVisitedPatience, RD_NEAR, true, false, Maps.humility);
arr[Maps.kindness]=add_map('Kindness', "Kindness", "kindness", true, true, BooleanFlags.HasVisitedPatience, RD_NEAR, true, false, Maps.kindness);
arr[Maps.patience]=add_map('Patience', "Patience", "patience", true, true, BooleanFlags.HasVisitedPatience, RD_NEAR, true, true, Maps.patience);
arr[Maps.temperence]=add_map('Temperence', "Temperence", "temperence", true, true, BooleanFlags.HasVisitedPatience, RD_NEAR, true, false, Maps.temperence);

arr[Maps.cave]=add_map('Cave', "Cave", "cave", true, true, BooleanFlags.HasVisitedPatience, RD_EXTREMELY_NEAR, false, false, Maps.cave);

(ds_map_find_value(all_mod_packages, BASE_ASSET)).my_maps=arr;
