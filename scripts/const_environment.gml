enum Environments {
    none,
    // General
    road,
    river,
    plain,
    ruin,
    // Mountain
    mountain,
    mountain_valley,
    mountain_seaside,
    mountain_open,
    mountain_bog,
    mountain_volcano,
    mountain_ice,
    // Water
    beach_lake,
    beach_ocean,
    ocean_north,
    ocean_east,
    ocean_south,
    lake,
    // Residential
    town,
    town_lake,
    town_ocean,
    town_mountain,
    city,
    city_lake,
    city_ocean,
    city_mountain,
    // Other
    plvr,
    bog,
    forest,
    island_dragon,
    island_ocean,
    cliffs,
    flowers,
    underground_generic,
}

globalvar all_environments;

all_environments[Environments.none]=add_environment('None', det_weather_default);
all_environments[Environments.road]=add_environment('Road', det_weather_default);
all_environments[Environments.river]=add_environment('River', det_weather_default);
all_environments[Environments.plain]=add_environment('Plain', det_weather_default);
all_environments[Environments.ruin]=add_environment('Ruin', det_weather_default);
all_environments[Environments.mountain]=add_environment('Mountain', det_weather_default);
all_environments[Environments.mountain_valley]=add_environment('Mountain Valley', det_weather_default);
all_environments[Environments.mountain_open]=add_environment('Mountain Open', det_weather_default);
all_environments[Environments.mountain_seaside]=add_environment('Mountain Open', det_weather_fog);
all_environments[Environments.mountain_bog]=add_environment('Mountain Bog', det_weather_default);
all_environments[Environments.mountain_volcano]=add_environment('Mountain Volcano', det_weather_default);
all_environments[Environments.mountain_ice]=add_environment('Mountain Ice', det_weather_default);
all_environments[Environments.beach_lake]=add_environment('Beach Lake', det_weather_default);
all_environments[Environments.beach_ocean]=add_environment('Beach Ocean', det_weather_default);
all_environments[Environments.ocean_north]=add_environment('Ocean North', det_weather_default);
all_environments[Environments.ocean_east]=add_environment('Ocean East', det_weather_default);
all_environments[Environments.ocean_south]=add_environment('Ocean South', det_weather_default);
all_environments[Environments.lake]=add_environment('Lake', det_weather_default);
all_environments[Environments.town]=add_environment('Town', det_weather_default);
all_environments[Environments.town_lake]=add_environment('Town Lake', det_weather_default);
all_environments[Environments.town_ocean]=add_environment('Town Ocean', det_weather_default);
all_environments[Environments.town_mountain]=add_environment('Town Mountain', det_weather_default);
all_environments[Environments.city]=add_environment('City', det_weather_default);
all_environments[Environments.city_lake]=add_environment('City Lake', det_weather_default);
all_environments[Environments.city_ocean]=add_environment('City Ocean', det_weather_default);
all_environments[Environments.city_mountain]=add_environment('City Mountain', det_weather_default);
all_environments[Environments.plvr]=add_environment('Pokémon League/Victory Road', det_weather_default);
all_environments[Environments.bog]=add_environment('Bog', det_weather_default);
all_environments[Environments.forest]=add_environment('Forest', det_weather_default);
all_environments[Environments.lake]=add_environment('Lake', det_weather_default);
all_environments[Environments.island_dragon]=add_environment('Island Dragon', det_weather_default);
all_environments[Environments.island_ocean]=add_environment('Island Ocean', det_weather_default);
all_environments[Environments.cliffs]=add_environment('Cliffs', det_weather_default);
all_environments[Environments.flowers]=add_environment('Flowers', det_weather_default);
all_environments[Environments.underground_generic]=add_environment('Underground Generic', det_weather_darkness);
