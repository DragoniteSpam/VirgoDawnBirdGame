enum TeleportSpots {
    CaveFromPatience,
    PatienceFromCave,
    UndergroundFromForest,
    ForestFromUnderground,
}

globalvar teleport_spots;
teleport_spots=ds_grid_create(100, 5);
