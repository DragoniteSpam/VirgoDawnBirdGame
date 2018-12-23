enum LocationFlags {
    no,
    terrain,
    water,
    lava,
    encounter,
    object,
    final,
}

globalvar location_flag_names;
location_flag_names[LocationFlags.no]=get_text(Text.lfNo);
location_flag_names[LocationFlags.terrain]=get_text(Text.lfTerrain);
location_flag_names[LocationFlags.water]=get_text(Text.lfWater);
location_flag_names[LocationFlags.lava]=get_text(Text.lfLava);
location_flag_names[LocationFlags.encounter]=get_text(Text.lfEncounter);
location_flag_names[LocationFlags.object]=get_text(Text.lfObject);

globalvar location_flag_can_jump;
location_flag_can_jump=array_add(LocationFlags.final, true);
location_flag_can_jump[LocationFlags.no]=false;
location_flag_can_jump[LocationFlags.water]=false;
location_flag_can_jump[LocationFlags.lava]=false;

enum EventFlags {
    no,
    encounter,
}

enum Colors {
    RED,
    BLUE,
    YELLOW,
    GREEN,
    BLACK,
    BROWN,
    PURPLE,
    GRAY,
    WHITE,
    PINK,
    SIGN_ROUTE_BLUE,
}

globalvar color_values, color_names, color_particles;

// the localization names are commented out because the have to
// be un-localized for the cutscene scripts

color_names[Colors.RED]='Red';  // get_text(Text.colRed);
color_names[Colors.BLUE]='Blue';// get_text(Text.colBlue);
color_names[Colors.YELLOW]='Yellow';// get_text(Text.colYellow);
color_names[Colors.GREEN]='Green';  // get_text(Text.colGreen);
color_names[Colors.BLACK]='Black';  // get_text(Text.colBlack);
color_names[Colors.BROWN]='Brown';  // get_text(Text.colBrown);
color_names[Colors.PURPLE]='Purple';// get_text(Text.colPurple);
color_names[Colors.GRAY]='Gray';// get_text(Text.colGray);
color_names[Colors.WHITE]='White';  // get_text(Text.colWhite);
color_names[Colors.PINK]='Pink';//get_text(Text.colPink);
color_names[Colors.SIGN_ROUTE_BLUE]='RouteBlue';    // get_text(Text.colRSBlue);

color_values[Colors.RED]=c_red;
color_values[Colors.BLUE]=c_blue;
color_values[Colors.YELLOW]=c_yellow;
color_values[Colors.GREEN]=c_green;
color_values[Colors.BLACK]=c_black;
color_values[Colors.BROWN]=c_brown;
color_values[Colors.PURPLE]=c_purple;
color_values[Colors.GRAY]=c_gray;
color_values[Colors.WHITE]=c_white;
color_values[Colors.PINK]=c_pink;
color_values[Colors.SIGN_ROUTE_BLUE]=make_colour_rgb(0, 123, 255);

color_particles[Colors.RED]=ds_list_create_with(ParticleColors.RED, ParticleColors.RED, ParticleColors.ORANGE, ParticleColors.YELLOW, ParticleColors.BRONZE, ParticleColors.RED);
color_particles[Colors.BLUE]=ds_list_create_with(ParticleColors.BLUE, ParticleColors.BLUE2, ParticleColors.BLUE, ParticleColors.BLUE2, ParticleColors.GREEN, ParticleColors.BLUE);
color_particles[Colors.YELLOW]=ds_list_create_with(ParticleColors.YELLOW, ParticleColors.YELLOW, ParticleColors.ORANGE, ParticleColors.YELLOW, ParticleColors.YELLOW);
color_particles[Colors.GREEN]=ds_list_create_with(ParticleColors.GREEN, ParticleColors.GREEN2, ParticleColors.GREEN, ParticleColors.GREEN2, ParticleColors.BLUE, ParticleColors.BLUE2);
color_particles[Colors.BLACK]=ds_list_create_with(ParticleColors.BLACK, ParticleColors.BLACK, ParticleColors.BLACK, ParticleColors.GRAY, ParticleColors.GRAY2, ParticleColors.BLACK);
color_particles[Colors.BROWN]=ds_list_create_with(ParticleColors.BRONZE, ParticleColors.BRONZE, ParticleColors.WHITE, ParticleColors.YELLOW, ParticleColors.BRONZE, ParticleColors.BRONZE);
color_particles[Colors.PURPLE]=ds_list_create_with(ParticleColors.PURPLE, ParticleColors.PURPLE, ParticleColors.BLUE, ParticleColors.PURPLE, ParticleColors.GRAY, ParticleColors.PURPLE);
color_particles[Colors.GRAY]=ds_list_create_with(ParticleColors.GRAY, ParticleColors.GRAY2, ParticleColors.GRAY, ParticleColors.GRAY2, ParticleColors.WHITE, ParticleColors.BLACK);
color_particles[Colors.WHITE]=ds_list_create_with(ParticleColors.WHITE, ParticleColors.WHITE, ParticleColors.WHITE, ParticleColors.WHITE, ParticleColors.GRAY, ParticleColors.GRAY2);
color_particles[Colors.PINK]=ds_list_create_with(ParticleColors.RED, ParticleColors.WHITE, ParticleColors.RED, ParticleColors.WHITE, ParticleColors.BRONZE, ParticleColors.WHITE);
color_particles[Colors.SIGN_ROUTE_BLUE]=color_particles[Colors.BLUE];

enum BooleanFlags {
    GenericDoor,
    locked,
    unlocked,
    StorageBarn,
    AstronomerHouse,
    HasVisitedPatience,
    HasVisitedChastity,
    HasVisitedRavine,
    HasVisitedFarm,
    HasVisitedCoast,
    Badge15,
    Badge16,
    Badge17,
    Badge18,
    Badge19,
    E401,
    E402,
    E403,
    E404,
    E4Champion,
    HasCreditsBook,HasReadCreditsBook,
    HasTestItem,HasTestAnimal,
    CastleDoor1,CastleDoor2,CastleDoor3,CastleDoor4,
    IllumDoor1,IllumDoor2,IllumDoor3,IllumDoor4,
    BLANK12,BLANK13,BLANK14,BLANK15,BLANK16,BLANK17,BLANK18,BLANK19,
    BLANK20,BLANK21,BLANK22,BLANK23,BLANK24,BLANK25,BLANK26,BLANK27,BLANK28,BLANK29,
    BLANK30,BLANK31,BLANK32,BLANK33,BLANK34,BLANK35,BLANK36,BLANK37,BLANK38,BLANK39,
    BLANK40,BLANK41,BLANK42,BLANK43,BLANK44,BLANK45,BLANK46,BLANK47,BLANK48,BLANK49,
    BLANK50,BLANK51,BLANK52,BLANK53,BLANK54,BLANK55,BLANK56,BLANK57,BLANK58,BLANK59,
    BLANK60,BLANK61,BLANK62,BLANK63,BLANK64,BLANK65,BLANK66,BLANK67,BLANK68,BLANK69,
    BLANK70,BLANK71,BLANK72,BLANK73,BLANK74,BLANK75,BLANK76,BLANK77,BLANK78,BLANK79,
    BLANK80,BLANK81,BLANK82,BLANK83,BLANK84,BLANK85,BLANK86,BLANK87,BLANK88,BLANK89,
    BLANK90,BLANK91,BLANK92,BLANK93,BLANK94,BLANK95,BLANK96,BLANK97,BLANK98,BLANK99,
}

globalvar boolean_flags;

// extend this if necessary
for (var i=1024; i>=0; i--){
    boolean_flags[i, 2]=get_text(Text.na);
    boolean_flags[i, 1]=get_text(Text.no);
    boolean_flags[i, 0]=LOCKED;
}

boolean_flags[BooleanFlags.GenericDoor, 1]=get_text(Text.bfGenDoor);
boolean_flags[BooleanFlags.locked, 1]=get_text(Text.bfLocked);
boolean_flags[BooleanFlags.locked, 2]=get_text(Text.bfdLocked);
boolean_flags[BooleanFlags.unlocked, 0]=UNLOCKED;
boolean_flags[BooleanFlags.unlocked, 1]=get_text(Text.bfUnlocked);
boolean_flags[BooleanFlags.unlocked, 2]=get_text(Text.bfdUnlocked);
boolean_flags[BooleanFlags.StorageBarn, 1]=get_text(Text.bfStorageBarn);
boolean_flags[BooleanFlags.StorageBarn, 2]=get_text(Text.bfdStorageBarn);
boolean_flags[BooleanFlags.HasVisitedPatience, 1]=get_text(Text.bfHvPatience);
boolean_flags[BooleanFlags.HasVisitedPatience, 2]=get_text(Text.bfHvPatience);
boolean_flags[BooleanFlags.HasVisitedChastity, 1]=get_text(Text.bfHvChastity);
boolean_flags[BooleanFlags.HasVisitedChastity, 2]=get_text(Text.bfdHVForest);
boolean_flags[BooleanFlags.HasVisitedRavine, 1]=get_text(Text.bfHVRavine);
boolean_flags[BooleanFlags.HasVisitedRavine, 2]=get_text(Text.bfdHVRavine);
boolean_flags[BooleanFlags.HasVisitedFarm, 1]=get_text(Text.bfHVFarm);
boolean_flags[BooleanFlags.HasVisitedFarm, 2]=get_text(Text.bfdHVFarm);
boolean_flags[BooleanFlags.HasVisitedCoast, 1]=get_text(Text.bfHVCoast);
boolean_flags[BooleanFlags.HasVisitedCoast, 2]=get_text(Text.bfdHVCoast);

boolean_flags[BooleanFlags.CastleDoor1, 1]=get_text(Text.bfCastleDoor1);
boolean_flags[BooleanFlags.CastleDoor1, 2]=get_text(Text.bfdCastleDoor1);
boolean_flags[BooleanFlags.CastleDoor2, 1]=get_text(Text.bfCastleDoor2);
boolean_flags[BooleanFlags.CastleDoor2, 2]=get_text(Text.bfdCastleDoor2);
boolean_flags[BooleanFlags.CastleDoor3, 1]=get_text(Text.bfCastleDoor3);
boolean_flags[BooleanFlags.CastleDoor3, 2]=get_text(Text.bfdCastleDoor3);
boolean_flags[BooleanFlags.CastleDoor4, 1]=get_text(Text.bfCastleDoor4);
boolean_flags[BooleanFlags.CastleDoor4, 2]=get_text(Text.bfdCastleDoor4);

boolean_flags[BooleanFlags.IllumDoor1, 1]=get_text(Text.bfIllumDoor1);
boolean_flags[BooleanFlags.IllumDoor1, 2]=get_text(Text.bfdIllumDoor1);
boolean_flags[BooleanFlags.IllumDoor2, 1]=get_text(Text.bfIllumDoor2);
boolean_flags[BooleanFlags.IllumDoor2, 2]=get_text(Text.bfdIllumDoor2);
boolean_flags[BooleanFlags.IllumDoor3, 1]=get_text(Text.bfIllumDoor3);
boolean_flags[BooleanFlags.IllumDoor3, 2]=get_text(Text.bfdIllumDoor3);
boolean_flags[BooleanFlags.IllumDoor4, 1]=get_text(Text.bfIllumDoor4);
boolean_flags[BooleanFlags.IllumDoor4, 2]=get_text(Text.bfdIllumDoor4);

// these need to go up by powers of two
enum ModelFlags {
    is_plant=1,
    is_terrain=2,
}
