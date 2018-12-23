enum Languages {
    ENGLISH,
}

// Single quote these to signify that they should be constant
// regardless of the language setting
lang_code[Languages.ENGLISH]='en';

enum Text {
    no,
    titleNew,titleLoad,titleDelete,titleQuit,
    titleSplashEngine,titleSplashCopy,
    dtAllDay,dtNight,dtMorning,dtAfternoon,dtEvening,
    diffNoob,diffEasy,diffRegular,diffHard,diffMasochist,
    comMelee,comRange,comNerd,
    lfNo,lfTerrain,lfWater,lfLava,lfEncounter,lfObject,
    colRed,colBlue,colYellow,colGreen,colBlack,colBrown,
    colPurple,colGray,colWhite,colPink,colRSBlue,
    na,
    bfGenDoor,bfLocked,bfdLocked,bfUnlocked,bfdUnlocked,
    bfStorageBarn,bfdStorageBarn,bfAstronomer,bfdAstronomer,
    bfHVAviary,bfdHVAviary,bfHVForest,bfdHVForest,bfHVRavine,bfdHVRavine,
    bfHVFarm,bfdHVFarm,bfHVCoast,bfdHVCoast,
    bf05,bfd05,bf06,bfd06,bf07,bfd07,bf08,bfd08,bf09,bfd09,
    bf10,bfd10,bf11,bfd11,bf12,bfd12,bf13,bfd13,bf14,bfd14,
    bf15,bfd15,bf16,bfd16,bf17,bfd17,bf18,bfd18,bf19,bfd19,
    bf20,bfd20,bf21,bfd21,bf22,bfd22,bf23,bfd23,bf24,bfd24,
    bf25,bfd25,bf26,bfd26,bf27,bfd27,bf28,bfd28,bf29,bfd29,
    bf30,bfd30,bf31,bfd31,bf32,bfd32,bf33,bfd33,bf34,bfd34,
    bf35,bfd35,bf36,bfd36,bf37,bfd37,bf38,bfd38,bf39,bfd39,
    bf40,bfd40,bf41,bfd41,bf42,bfd42,bf43,bfd43,bf44,bfd44,
    bf45,bfd45,bf46,bfd46,bf47,bfd47,bf48,bfd48,bf49,bfd49,
    bf50,bfd50,bf51,bfd51,bf52,bfd52,bf53,bfd53,bf54,bfd54,
    bf55,bfd55,bf56,bfd56,bf57,bfd57,bf58,bfd58,bf59,bfd59,
    bf60,bfd60,bf61,bfd61,bf62,bfd62,bf63,bfd63,bf64,bfd64,
    bf65,bfd65,bf66,bfd66,bf67,bfd67,bf68,bfd68,bf69,bfd69,
    bf70,bfd70,bf71,bfd71,bf72,bfd72,bf73,bfd73,bf74,bfd74,
    bf75,bfd75,bf76,bfd76,bf77,bfd77,bf78,bfd78,bf79,bfd79,
    bf80,bfd80,bf81,bfd81,bf82,bfd82,bf83,bfd83,bf84,bfd84,
    bf85,bfd85,bf86,bfd86,bf87,bfd87,bf88,bfd88,bf89,bfd89,
    bf90,bfd90,bf91,bfd91,bf92,bfd92,bf93,bfd93,bf94,bfd94,
    bf95,bfd95,bf96,bfd96,bf97,bfd97,bf98,bfd98,bf99,bfd99,
    msStill,msWalking,msRunning,msBiking,msSurfing,msFlying,
    gmEditObject,gmEditEvent,gmEditMap,gmEditFile,gmEditGame,
    gmEditQuest,gmEditText,gmEditCutscene,gmEdit02,gmEdit03,gmEdit04,
    gmPlay,gmAnimal,gmConsole,gmTitle,
    txtGenMale,txtGenFemale,txtGenderless,txtGenBoth,
    txtGenHis,txtGenHer,txtGenIts,txtGenTheir,
    txtGenHim,txtGenHer2,txtGenIt,txtGenThey,
    txtGenHe,txtGenShe,
    statHP,statAtk,statDef,statSpA,statSpD,statSpE,
    tsFast,tsFaster,tsFastest,tsLightning,
    moJan,moFeb,moMar,moApr,moMay,moJun,
    moJul,moAug,moSep,moOct,moNov,moDec,
    moWinter,moFall,moSummer,moSpring,
    menuInventory,menuSettings,menuSave,menuReturn,menuQuit,
    menuMap,
    menu02,menu03,menu04,menu05,menu06,menu07,menu08,
    menuInventoryDescription,menuInventoryDescriptionEmpty,
    menuSettingsDescription,menuSaveDescription,menuReturnDescription,menuQuitDescription,
    menuMapDescription,
    menu02Description,menu03Description,menu04Description,
    menu05Description,menu06Description,menu07Description,menu08Description,
    menuQuitConfirm,menuQuitToTitle,menuQuitToWindows,menuQuitCancel,
    utilLoadingTook,utilLoadingSeconds,utilLoading,
    titleSaveDelete,
    yeah,nah,
    utilShowMoney,
    utilGameHasLostFocus,utilGameHasLostFocusSub,
    utilCantGoThatWay,utilNoTitleDebug,
    keyEscape,keyTab,keyLControl,keyLShift,keyLAlt,keyRControl,
    keyRShift,keyRAlt,keySpace,keyEnter,keyBackspace,keyUp,
    keyDown,keyLeft,keyRight,keyLMouse,keyMMouse,keyRMouse,
    keyInsert,keyDelete,keyHome,keyEnd,keyPgUp,keyPgDown,
    questCompletedObjective,questNextObjective,
    questCompletedQuest,questStartedQuest,
    itemObtainedAn,itemObtainedPlural,
    gmEditInventory,
    itemRemovedAn,
    itemRemovedPlural,
    utilWaitUp,
    utilUnlockedDoor,
    worldPutOutFire,
    worldLightFire,
    worldDoor,
    worldDoorUnlocked,
    worldDoorIsLocked,
    invUse,
    invBack,
    invYouHave,
    invPocket,
    settReturn,
    settDefaults,
    settAudio,
    settGraphics,
    settControl,
    settGameplay,
    settReturnDescription,
    settDefaultsDescription,
    settAudioDescription,
    settGraphicsDescription,
    settControlDescription,
    settGameplayDescription,
    settBackToSettings,
    settBackToSettingsDescription,
    settGraphicsDefaults,
    settGraphicsDefaultsDescription,
    settTextColor,
    settTextColorDescription,
    settPrintColor,
    settPrintColorDescription,
    settBackgroundColor,
    settBackgroundColorDescription,
    settCrosshair,
    settCrosshairNone,
    settCrosshairDefault,
    settCrosshairLine,
    settCrosshairCircular,
    settAtmosphere,
    settAtmosphereDescription,
    settRenderDistance,
    settRenderDistanceShort,
    settRenderDistanceDefault,
    settRenderDistanceFar,
    settFOV,
    settFOVDescription,
    settFullscreen,
    settFullscreenOn,
    settFullscreenOff,
    settReset,
    settColorPicker,
    settColorPickerDescription,
    bfHvPatience,
    bfHvChastity,
    bfHVUForest,
    bfdHVUForest,
    bfHVURavine,
    bfdHVURavine,
    bfHVUFarm,
    bfdHVUFarm,
    bfHVUCoast,
    bfdHVUCoast,
    settRenderDistanceLights,
    settRenderDistanceLightsDescription,
    settRenderDistanceLightsOffDescription,
    gmEditAll,
    menuTeam,
    menuTeamDescription,
    menuTeamDescriptionEmpty,
    menuTeamEmpty,
    miscAddTeammate,
    gmEditGeneration,
    gmGameOver,
    settHardMode,
    invEquip,
    worldSproingName,
    worldSproingSproingy,
    bfCastleDoor1,
    bfdCastleDoor1,
    bfCastleDoor2,
    bfdCastleDoor2,
    bfCastleDoor3,
    bfdCastleDoor3,
    bfCastleDoor4,
    bfdCastleDoor4,
    bfIllumDoor1,
    bfdIllumDoor1,
    bfIllumDoor2,
    bfdIllumDoor2,
    bfIllumDoor3,
    bfdIllumDoor3,
    bfIllumDoor4,
    bfdIllumDoor4,
    ftCantFastTravel,
    ok,
    ftGetAsk,
    settDifficulty,
    dtMob,    dtDrown,    dtLava,    dtOther,   dtTranslate,
    titleLoad1,    titleLoad2,    titleLoad3,   titleNoSave,
    gmEditDatabase,
    warningModNotFound,
    warningVRANotFound,
    warningModMissing,
    FINAL
}

globalvar game_text, game_text_dynamic;
game_text=array_add_2d(Text.FINAL, 1, '');
game_text_dynamic=array_add_2d(10000, 1, '');

var buffer=buffer_load('.\lang\data\'+lang_code[language]+'.bin');
var buffer_d=buffer_load('.\lang\dynamic\'+lang_code[language]+'.bin');
var size=buffer_get_size(buffer);
var size_d=buffer_get_size(buffer_d);
for (var i=0; i<Text.FINAL; i++){
    if (buffer_tell(buffer)<size){
        game_text[i, 0]=buffer_read(buffer, buffer_string);
    }
    if (buffer_tell(buffer)<size){
        game_text[i, 1]=buffer_read(buffer, buffer_string);
    }
    if (buffer_tell(buffer_d)<size_d){
        game_text_dynamic[i, 0]=buffer_read(buffer_d, buffer_string);
    }
    if (buffer_tell(buffer_d)<size_d){
        game_text_dynamic[i, 1]=buffer_read(buffer_d, buffer_string);
    }
}

buffer_delete(buffer);
buffer_delete(buffer_d);

// Temp
game_text[Text.gmEditAll, 0]="gmEditAll";
game_text[Text.gmEditAll, 1]="All Selectable Instances";
game_text[Text.menuTeam, 0]="menuTeam";
game_text[Text.menuTeam, 1]="Team";
game_text[Text.menuTeamDescription, 0]="menuTeamDescription";
game_text[Text.menuTeamDescription, 1]="The creatures you're carrying with you. Don't ask how.";
game_text[Text.menuTeamDescriptionEmpty, 0]="menuTeamDescriptionEmpty";
game_text[Text.menuTeamDescriptionEmpty, 1]="##You don't have anyone with you.";
game_text[Text.menuTeamEmpty, 0]="menuTeamEmpty";
game_text[Text.menuTeamEmpty, 1]="You're all alone!";
game_text[Text.miscAddTeammate, 0]="miscAddTeammate";
game_text[Text.miscAddTeammate, 1]=" has joined your team!";
game_text[Text.gmEditGeneration, 0]="gmEditGeneration";
game_text[Text.gmEditGeneration, 1]="Generation";
game_text[Text.gmGameOver, 0]="gmGameOver";
game_text[Text.gmGameOver, 1]="Game Over";
game_text[Text.settHardMode, 0]="settHardMode";
game_text[Text.settHardMode, 1]="Hard Mode";
game_text[Text.invEquip, 0]="invEquip";
game_text[Text.invEquip, 1]="Equip";
game_text[Text.worldSproingName, 0]="worldSproingName";
game_text[Text.worldSproingName, 1]="Sproing";
game_text[Text.worldSproingSproingy, 0]="worldSproingSproingy";
game_text[Text.worldSproingSproingy, 1]="Sproingy";
game_text[Text.bfHvPatience, 0]="bfHvPatience";
game_text[Text.bfHvPatience, 1]="Has Visited Patience";
game_text[Text.bfHvChastity, 0]="bfHvChastity";
game_text[Text.bfHvChastity, 1]="Has Visited Chastity";

game_text[Text.bfCastleDoor1, 0]="bfCastleDoor1";
game_text[Text.bfCastleDoor1, 1]="Castle Door 1";
game_text[Text.bfdCastleDoor1, 0]="bfdCastleDoor1";
game_text[Text.bfdCastleDoor1, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfCastleDoor2, 0]="bfCastleDoor2";
game_text[Text.bfCastleDoor2, 1]="Castle Door 2";
game_text[Text.bfdCastleDoor2, 0]="bfdCastleDoor2";
game_text[Text.bfdCastleDoor2, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfCastleDoor3, 0]="bfCastleDoor3";
game_text[Text.bfCastleDoor3, 1]="Castle Door 3";
game_text[Text.bfdCastleDoor3, 0]="bfdCastleDoor3";
game_text[Text.bfdCastleDoor3, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfCastleDoor4, 0]="bfCastleDoor4";
game_text[Text.bfCastleDoor4, 1]="Castle Door 4";
game_text[Text.bfdCastleDoor4, 0]="bfdCastleDoor4";
game_text[Text.bfdCastleDoor4, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfIllumDoor1, 0]="bfIllumDoor1";
game_text[Text.bfIllumDoor1, 1]="Illum Door 1";
game_text[Text.bfdIllumDoor1, 0]="bfdIllumDoor1";
game_text[Text.bfdIllumDoor1, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfIllumDoor2, 0]="bfIllumDoor2";
game_text[Text.bfIllumDoor2, 1]="Illum Door 2";
game_text[Text.bfdIllumDoor2, 0]="bfdIllumDoor2";
game_text[Text.bfdIllumDoor2, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfIllumDoor3, 0]="bfIllumDoor3";
game_text[Text.bfIllumDoor3, 1]="Illum Door 3";
game_text[Text.bfdIllumDoor3, 0]="bfdIllumDoor3";
game_text[Text.bfdIllumDoor3, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.bfIllumDoor4, 0]="bfIllumDoor4";
game_text[Text.bfIllumDoor4, 1]="Illum Door 4";
game_text[Text.bfdIllumDoor4, 0]="bfdIllumDoor4";
game_text[Text.bfdIllumDoor4, 1]="This door is locked. Perhaps you can find a key to unlock it.";

game_text[Text.menuMap, 0]="menuMap";
game_text[Text.menuMap, 1]="Map";
game_text[Text.menuMapDescription, 0]="menuMapDescription";
game_text[Text.menuMapDescription, 1]="View and interact with a map of the game world.";
game_text[Text.ftCantFastTravel, 0]="ftCantFastTravel";
game_text[Text.ftCantFastTravel, 1]="You can't fast travel in combat!";
game_text[Text.ok, 0]="ok";
game_text[Text.ok, 1]="Okay";
game_text[Text.ftGetAsk, 0]="ftGetAsk";
game_text[Text.ftGetAsk, 1]="Would you like to Fast Travel to this location?";

game_text[Text.gmEditCutscene, 0]="gmEditCutscene";
game_text[Text.gmEditCutscene, 1]="Cutscenes";

game_text[Text.settDifficulty, 0]="settDifficulty";
game_text[Text.settDifficulty, 1]="Difficulty";

game_text[Text.keyRMouse, 1]="RMouse";
game_text[Text.keyRAlt, 1]="RAlt";
game_text[Text.keyRControl, 1]="RControl";
game_text[Text.keyRShift, 1]="RShift";
game_text[Text.keyLMouse, 1]="LMouse";
game_text[Text.keyLAlt, 1]="LAlt";
game_text[Text.keyLControl, 1]="LControl";
game_text[Text.keyLShift, 1]="LShift";

game_text[Text.dtOther, 0]="dtOther";
game_text[Text.dtOther, 1]="Death by Other Methods";
game_text[Text.dtDrown, 0]="dtDrown";
game_text[Text.dtDrown, 1]="Death by Drowning";
game_text[Text.dtMob, 0]="dtMob";
game_text[Text.dtMob, 1]="Death by Someone";
game_text[Text.dtLava, 0]="dtLava";
game_text[Text.dtLava, 1]="Death by Lava";
game_text[Text.dtTranslate, 0]="dtTranslate";
game_text[Text.dtTranslate, 1]="Death by Translation";

game_text[Text.titleLoad1, 0]="titleLoad1";
game_text[Text.titleLoad1, 1]="Load Save 1";
game_text[Text.titleLoad2, 0]="titleLoad2";
game_text[Text.titleLoad2, 1]="Load Save 2";
game_text[Text.titleLoad3, 0]="titleLoad3";
game_text[Text.titleLoad3, 1]="Load Save 3";
game_text[Text.titleNoSave, 0]="titleNoSave";
game_text[Text.titleNoSave, 1]="(No Save)";

game_text[Text.gmEditDatabase, 0]="gmEditDatabase";
game_text[Text.gmEditDatabase, 1]="Database";

game_text[Text.warningModNotFound, 0]="warningModNotFound";
game_text[Text.warningModNotFound, 1]="Hey, listen - we counted &0 installed mod(s) but could only find &1 of them. If you moved or deleted anything by accident, we'd really appreciate it if you put it back.##The game will attempt to load anyway but we can't promise that everything will work as intended.";
game_text[Text.warningVRANotFound, 0]="warningVRANotFound";
game_text[Text.warningVRANotFound, 1]="Hey, listen - data file &0 is looking for a model said to be stored in the archive &1, which could not be found. If you moved or deleted it by accident, we'd really appreciated it if you put it back.##Since the game (probably) needs these assets in order to function properly, it will have to shut down now. If you find the files, feel free to restart it.";
game_text[Text.warningModMissing, 0]="warningModMissing";
game_text[Text.warningModMissing, 1]="Hey, listen - the mod &0 is looking for another required mod (or the base data file thing), but we can't find it. Check the dependencies that were probably listed where you downloaded the mod, and make sure they're loaded into the game BEFORE this one (check the load order in the Mods section of the launcher).##We'll try to play the game anyway but if something acts funny, that's probably why.";
