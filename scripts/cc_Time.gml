enum Months {
    none,
    January,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    November,
    December,
}

month_names[Months.none]=get_text(Text.na);
month_names[Months.January]=get_text(Text.moJan);
month_names[Months.February]=get_text(Text.moFeb);
month_names[Months.March]=get_text(Text.moMar);
month_names[Months.April]=get_text(Text.moApr);
month_names[Months.May]=get_text(Text.moMay);
month_names[Months.June]=get_text(Text.moJun);
month_names[Months.July]=get_text(Text.moJul);
month_names[Months.August]=get_text(Text.moAug);
month_names[Months.September]=get_text(Text.moSep);
month_names[Months.October]=get_text(Text.moOct);
month_names[Months.November]=get_text(Text.moNov);
month_names[Months.December]=get_text(Text.moDec);

enum Seasons {
    Spring,
    Summer,
    Fall,
    Winter,
}

season_names[Seasons.Winter]=get_text(Text.moWinter);
season_names[Seasons.Fall]=get_text(Text.moFall);
season_names[Seasons.Summer]=get_text(Text.moSummer);
season_names[Seasons.Spring]=get_text(Text.moSpring);
