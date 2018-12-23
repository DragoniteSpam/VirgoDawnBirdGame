/// double GetCardinalDirection(angle);

if (argument0<45||argument0>=315)
    return Directions.east;
if (argument0<135)
    return Directions.north;
if (argument0<225)
    return Directions.west;

return Directions.south;
