enum LocationIcons {
    none,
    final
}

globalvar all_location_icons;
all_location_icons=array_create(LocationIcons.final);

all_location_icons[LocationIcons.none]=b_icon_missing;
all_location_icons[LocationIcons.final]=b_icon_unused;
