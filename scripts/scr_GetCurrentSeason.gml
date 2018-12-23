/// boolean scr_GetCurrentSeason(ArgSet);

var catch=argument0;

World.keep_going=true;

switch (game_current_month){
    case Months.January:
    case Months.December:
    case Months.February:
        return Seasons.Winter;
    case Months.March:
    case Months.April:
    case Months.May:
        return Seasons.Spring;
    case Months.June:
    case Months.July:
    case Months.August:
        return Seasons.Summer;
    default:
        return Seasons.Fall;
}
