enum CutsceneScripts {
    addAchievement,         // * World
    addCurrency,            // * Player
    addItem,                // * Player
    cameraLock,             // * Camera
    cameraLockOntoActor,    // * Camera
    cameraUnlock,           // * Camera
    cameraUnlockOntoActor,  // * Camera
    createPushNotification, // * World
    effectCreate,           // * Selectable
    effectDestroy,          // * Effect
    effectSetTargetAlpha,   // * Effect
    fade,                   // * Camera
    fastTravel,             // * Player
    follow,                 // * EntityNPC
    gravityForce,           // * Entity
    hideMe,                 // * Entity
    hideMultiOption,        // * World
    hidePlayerMoney,        // * World
    jump,                   // * Entity
    lastLand,               // * Player
    lerpTowards,            // * EntityLerp
    light,                  // * EntityLamp, * EntityFire
    lockSet,                // * Player
    lockUnset,              // * Player
    moveTo,                 // * Entity
    moveToMarker,           // * Entity
    placeAtMe,              // * Entity
    push,                   // * Selectable
    questBegin,             // * World
    registerActor,          // * Selectable
    removeCurrency,         // * Player
    removeItem,             // * Player
    removeSelf,             // * Selectable
    restart,                // * World (for cutscenes)
    setModelIndex,          // * Entity
    setMovementScript,      // * Entity
    setMultiOption,         // * World
    setMultiOptionClear,    // * World
    setMultiOptionMore,     // * World
    setPlayerGender,        // * Player
    setPlayerNick,          // * Player
    showCooking,            // * World
    showHUD,                // * World
    showMap,                // * World
    showPlayerMoney,        // * World
    soundPlay,              // * Selectable
    soundPlayPickup,        // * Selectable
    soundStartBGM,          // * Selectable
    soundStop,              // * Selectable
    soundStopBGM,           // * Selectable
    stop,                   // * Selectable
    stringInputHide,        // * World
    stringInputShow,        // * World
    talk,                   // * Entity
    teleport,               // * Player
    teleportToMe,           // * Entity (of Player)
    teleportVar,            // * Entity
    toTitle,                // * World
    turn,                   // * Selectable
    turnToFace,             // * Selectable
    unlock,                 // * EntityDoor
    validateQuests,         // * World
    wait,                   // * World
    walk,                   // * EntityNPC
    walkToWaypoint,         // * EntityNPC
    weather,                // * World
    sysFlipHorizontal,      // * World
    sysFlipVertical,        // * World
    sysSave,                // * World
    sysQuoteRandomize,      // * World
    sysQuoteShow,           // * World
    getCurrency,            // * Player
    getRandomPercent,       // * World
    getCurrentSeason,       // * World
    getHasAchievement,      // * World
    getHasCompletedQuest,   // * World
    getHasItem,             // * Player
    getHasStartedQuest,     // * World
    getInputString,         // * World
    getInputStringEqualsPassword,   // * EntityDoorPassword
    getInventorySize,       // * Player
    getIsAfternoon,         // * World
    getIsEvening,           // * World
    getIsFollowingPlayer,   // * EntityNPC
    getIsMorning,           // * World
    getIsNight,             // * World
    getItemVendorQuantity,  // * EntityNPC
    getMultipleChoice,      // * World
    getMultipleChoiceOverQuit,  // * World
    getMyDirectionFix,      // * EntityNPC
    getMyItemName,          // * EntityTreasureChest
    getMyItemNameIndefinite,// * EntityTreasureChest
    getMyItemnamePlural,    // * EntitytreasureChest
    getMyItemNameQuantity,  // * EntityTreasureChest
    getMyItemQuantity,      // * EntityTreasureChest
    getMyVarKey,            // * EntityTeleport
    getMyName,              // * Selectable
    getMyText,              // * Entity
    getMyValue,             // * EventCollectable
    getX,                   // * Selectable, * Camera
    getY,                   // * Selectable, * Camera
    getZ,                   // * Selectable, * Camera
    getDirection,           // * Selectable, * Camera
    getPitch,               // * Selectable, * Camera
    getQuestCompleted,      // * World
    getQuestStage,          // * World
    getQuestText,           // * World
    moveToMoon,             // * Selectable
    lerpToMoon,             // * EntityLerp
    effectParticleStatic,   // * Selectable
    ifbranch,               // * World
    elsebranch,             // * World
    endif,                  // * World
    entityAddCurrency,      // * Entity
    entityGetCurrency,      // * Entity
    giveMyItems,            // * Treasure Chest
    unfollow,               // * EntityNPC
    confuse,                // * EntityNPC
    setAlive,               // * Entity
    restoreHP,              // * Entity
    restoreMP,              // * Entity
    getHealFull,            // * EventRestoreHP
    removeMe,               // * Selectable
    getMobilePosition,      // * EntityMobileTranlsate
    getMobileStyle,         // * EntityMobileTranslate
    getMobileActionSpeed,   // * EntityMobileTranslate, EntityMobileRotate
    getMobileEndAction,     // * EntityMobileTranslate
    getMobileAbsolute,      // * EntityMobileTranslate
    setMobilePosition,      // * EntityMobileTranslate
    setMobileStyle,         // * EntityMobileTranslate
    setMobileActionSpeed,   // * EntityMobileTranslate, EntityMobileRotate
    setMobileEndAction,     // * EntityMobileTranslate
    setMobileAbsolute,      // * EntityMobileTranslate
    getMobileActionAcceleration,// * EntityMobileRotate
    getMobileActionSpeedMax,// * EntityMobileRotate
    setMobileActionAcceleration,// * EntityMobileRotate
    setMobileActionSpeedMax,// * EntityMobileRotate
    sysLoad,                // * World
    sysCenterCursor,        // * World
    sysSetGameModePlay,     // * World
    getVar,                 // * World
    set2D,                  // * Camera
    set3D,                  // * Camera
    final,
}

enum VariableTypes {
    no,
    any,
    str,
    boolean,
    float,
    entity,
    effect,
    item,
    achievement,
    quest,
    movement_script,
    gender,
    se,
    bgm,
    map,
    map_marker,
    weather,
    color,
    model,
    interpolation_style,
    mobile_end_action,
    camera_plane,
    package,
}

variable_type_names[VariableTypes.model]="Model";
variable_type_names[VariableTypes.color]="Color";
variable_type_names[VariableTypes.weather]="Weather";
variable_type_names[VariableTypes.map_marker]="MapMarker";
variable_type_names[VariableTypes.map]="Map";
variable_type_names[VariableTypes.bgm]="BGM";
variable_type_names[VariableTypes.se]="SE";
variable_type_names[VariableTypes.gender]="Ggender";
variable_type_names[VariableTypes.movement_script]="MovementScript";
variable_type_names[VariableTypes.quest]="Quest";
variable_type_names[VariableTypes.achievement]="Achievement";
variable_type_names[VariableTypes.item]="Item";
variable_type_names[VariableTypes.effect]="Effect";
variable_type_names[VariableTypes.entity]="Entity";
variable_type_names[VariableTypes.float]="Float";
variable_type_names[VariableTypes.boolean]="Boolean";
variable_type_names[VariableTypes.str]="Str";
variable_type_names[VariableTypes.any]="Any";
variable_type_names[VariableTypes.interpolation_style]="InterpolationStyle";
variable_type_names[VariableTypes.mobile_end_action]="MobileEndAction";
variable_type_names[VariableTypes.camera_plane]="CameraPlane";
variable_type_names[VariableTypes.no]="No";
variable_type_names[VariableTypes.package]="Package";

globalvar all_cutscene_scripts;
all_cutscene_scripts=array_add(CutsceneScripts.final, noone);

all_cutscene_scripts[CutsceneScripts.addAchievement]=add_cutscene_script("addAchievement", scr_ach, VariableTypes.no, "achievement", VariableTypes.achievement);
all_cutscene_scripts[CutsceneScripts.addCurrency]=add_cutscene_script("addCurrency", scr_add_currency, VariableTypes.no, "amount", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.addItem]=add_cutscene_script("addItem", scr_add_item, VariableTypes.no, "package", VariableTypes.package, "item", VariableTypes.item, "quantity", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.cameraLock]=add_cutscene_script("cameraLock", scr_camera_lock, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.cameraLockOntoActor]=add_cutscene_script("cameraLockOntoActor", scr_camera_lock_onto_actor, VariableTypes.no, "entityPackage", VariableTypes.package, "entity", VariableTypes.entity);
all_cutscene_scripts[CutsceneScripts.cameraUnlock]=add_cutscene_script("cameraUnlock", scr_camera_unlock, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.cameraUnlockOntoActor]=add_cutscene_script("cameraUnlockOntoActor", scr_camera_unlock_onto_actor, VariableTypes.no);

all_cutscene_scripts[CutsceneScripts.createPushNotification]=add_cutscene_script("createPushNotification", scr_create_push, VariableTypes.no, "text", VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.effectCreate]=add_cutscene_script("effectCreate", scr_effect_create, VariableTypes.no, "effect", VariableTypes.effect, "x", VariableTypes.float, "y", VariableTypes.float, "z", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.effectDestroy]=add_cutscene_script("effectDestroy", scr_effect_destroy, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.effectSetTargetAlpha]=add_cutscene_script("effectSetTargetAlpha", scr_effect_set_target_alpha, VariableTypes.no, "alpha", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.fade]=add_cutscene_script("fade", scr_fade, VariableTypes.no, "color", VariableTypes.color, "value", VariableTypes.float, "seconds", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.fastTravel]=add_cutscene_script("fastTravel", scr_fast_travel, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.follow]=add_cutscene_script("follow", scr_follow, VariableTypes.no, "leaderPackage", VariableTypes.package, "leader", VariableTypes.entity);
all_cutscene_scripts[CutsceneScripts.unfollow]=add_cutscene_script("unfollow", scr_unfollow, VariableTypes.no);

all_cutscene_scripts[CutsceneScripts.gravityForce]=add_cutscene_script("gravityForce", scr_gravity_force, VariableTypes.no, "force?", VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.hideMe]=add_cutscene_script("hideMe", scr_hide_me, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.hideMultiOption]=add_cutscene_script("hideMultiOption", scr_hide_multi_option, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.hidePlayerMoney]=add_cutscene_script("hidePlayerMoney", scr_hide_player_money, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.jump]=add_cutscene_script("jump", scr_jump, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.lastLand]=add_cutscene_script("lastLand", scr_last_land, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.lerpTowards]=add_cutscene_script("lerpTowards", scr_lerp_towards, VariableTypes.no, "x", VariableTypes.float, "y", VariableTypes.float, "z", VariableTypes.float, "rate", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.light]=add_cutscene_script("light", scr_light, VariableTypes.no, "lit?", VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.lockSet]=add_cutscene_script("lockSet", scr_lock_set, VariableTypes.no);

all_cutscene_scripts[CutsceneScripts.lockUnset]=add_cutscene_script("lockUnset", scr_lock_unset, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.moveTo]=add_cutscene_script("moveTo", scr_move_to, VariableTypes.no, "x", VariableTypes.float, "y", VariableTypes.float, "z", VariableTypes.float, "[direction]", -VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.moveToMarker]=add_cutscene_script("moveToMarker", scr_move_to_marker, VariableTypes.no, "whoPackage", VariableTypes.package, "who", VariableTypes.entity, "targetPackage", VariableTypes.package, "target", VariableTypes.entity);
all_cutscene_scripts[CutsceneScripts.placeAtMe]=add_cutscene_script("placeAtMe", scr_place_at_me, VariableTypes.no, "destinationPackage", VariableTypes.package, "destination", VariableTypes.entity, "align", VariableTypes.boolean, "offsetX", VariableTypes.float, "offsetY", VariableTypes.float, "offsetZ", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.push]=add_cutscene_script("push", scr_push, VariableTypes.no, "register", VariableTypes.float, "value", VariableTypes.any);
all_cutscene_scripts[CutsceneScripts.questBegin]=add_cutscene_script("questBegin", scr_quest_begin, VariableTypes.no, "quest", VariableTypes.quest);
all_cutscene_scripts[CutsceneScripts.registerActor]=add_cutscene_script("registerActor", scr_register, VariableTypes.no, "whoPackage", VariableTypes.package, "who", VariableTypes.entity);

all_cutscene_scripts[CutsceneScripts.removeCurrency]=add_cutscene_script("removeCurrency", scr_remove_currency, VariableTypes.no, "amount", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.removeItem]=add_cutscene_script("removeItem", scr_remove_item, VariableTypes.no, "package", VariableTypes.package, "item", VariableTypes.item, "quantity", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.removeSelf]=add_cutscene_script("removeSelf", scr_remove_self, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.restart]=add_cutscene_script("restart", scr_restart, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.setModelIndex]=add_cutscene_script("setModelIndex", scr_set_model_index, VariableTypes.no, "package", VariableTypes.package, "index", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setMovementScript]=add_cutscene_script("setMovementScript", scr_set_movement_script, VariableTypes.no, "script", VariableTypes.movement_script);
all_cutscene_scripts[CutsceneScripts.setMultiOption]=add_cutscene_script("setMultiOption", scr_set_multi_option, VariableTypes.no, "[option1]", -VariableTypes.str, "[value1]", -VariableTypes.float, "[option2]", -VariableTypes.str, "[value2]", -VariableTypes.float, "[option3]", -VariableTypes.str, "[value3]", -VariableTypes.float, "[option4]", -VariableTypes.str, "[value4]", -VariableTypes.float,
    "[option5]", -VariableTypes.str, "[value5]", -VariableTypes.float, "[option6]", -VariableTypes.str, "[value6]", -VariableTypes.float, "[option7]", -VariableTypes.str, "[value7]", -VariableTypes.float, "[option8]", -VariableTypes.str, "[value8]", -VariableTypes.float, "[option9]", -VariableTypes.str, "[value9]", -VariableTypes.float, "[option10]", -VariableTypes.str, "[value10]", -VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setMultiOptionClear]=add_cutscene_script("setMultiOptionClear", scr_set_multi_option_clear, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.setMultiOptionMore]=add_cutscene_script("setMultiOptionMore", scr_set_multi_option_more, VariableTypes.no, "[option1]", -VariableTypes.str, "[value1]", -VariableTypes.float, "[option2]", -VariableTypes.str, "[value2]", -VariableTypes.float, "[option3]", -VariableTypes.str, "[value3]", -VariableTypes.float, "[option4]", -VariableTypes.str, "[value4]", -VariableTypes.float,
    "[option5]", -VariableTypes.str, "[value5]", -VariableTypes.float, "[option6]", -VariableTypes.str, "[value6]", -VariableTypes.float, "[option7]", -VariableTypes.str, "[value7]", -VariableTypes.float, "[option8]", -VariableTypes.str, "[value8]", -VariableTypes.float, "[option9]", -VariableTypes.str, "[value9]", -VariableTypes.float, "[option10]", -VariableTypes.str, "[value10]", -VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.setPlayerGender]=add_cutscene_script("setPlayerGender", scr_set_player_gender, VariableTypes.no, "gender", VariableTypes.gender);
all_cutscene_scripts[CutsceneScripts.setPlayerNick]=add_cutscene_script("setPlayerNick", scr_set_player_nick, VariableTypes.no, "nick", VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.showCooking]=add_cutscene_script("showCooking", scr_show_cooking, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.showHUD]=add_cutscene_script("showHUD", scr_show_hud, VariableTypes.no, "show?", VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.showMap]=add_cutscene_script("showMap", scr_show_map, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.showPlayerMoney]=add_cutscene_script("showPlayerMoney", scr_show_player_money, VariableTypes.no);

all_cutscene_scripts[CutsceneScripts.soundPlay]=add_cutscene_script("soundPlay", scr_sound_play, VariableTypes.no, "sound", VariableTypes.se, "loops?", VariableTypes.boolean, "[fadeintime]", -VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.soundPlayPickup]=add_cutscene_script("soundPlayPickup", scr_play_se_pickup, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.soundStartBGM]=add_cutscene_script("soundStartBGM", scr_sound_start_bgm, VariableTypes.no, "package", VariableTypes.package, "bgm", VariableTypes.se, "loops?", VariableTypes.boolean, "[fadeintime]", -VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.soundStop]=add_cutscene_script("soundStop", scr_sound_stop, VariableTypes.no, "sound", VariableTypes.se, "fadeouttime", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.soundStopBGM]=add_cutscene_script("soundStopBGM", scr_sound_stop_bgm, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.stop]=add_cutscene_script("stop", scr_stop, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.stringInputHide]=add_cutscene_script("stringInputHide", scr_string_input_hide, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.stringInputShow]=add_cutscene_script("stringInputShow", scr_string_input_set, VariableTypes.no, "defaultString", VariableTypes.str, "limit", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.talk]=add_cutscene_script("talk", scr_talk, VariableTypes.no, "text", VariableTypes.str, "[showArrow]", -VariableTypes.boolean);

all_cutscene_scripts[CutsceneScripts.teleport]=add_cutscene_script("teleport", scr_teleport, VariableTypes.no, "mapPackage", VariableTypes.package, "map", VariableTypes.map, "marker", VariableTypes.map_marker);
all_cutscene_scripts[CutsceneScripts.teleportToMe]=add_cutscene_script("teleportToMe", scr_teleport_to_me, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.teleportVar]=add_cutscene_script("teleportVar", scr_teleport_var, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.toTitle]=add_cutscene_script("toTitle", scr_to_title, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.turn]=add_cutscene_script("turn", scr_turn, VariableTypes.no, "target", VariableTypes.float, "speed", VariableTypes.float, "absolute?", VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.turnToFace]=add_cutscene_script("turnToFace", scr_turn_to_face, VariableTypes.no, "targetPackage", VariableTypes.package, "target", VariableTypes.entity);
all_cutscene_scripts[CutsceneScripts.unlock]=add_cutscene_script("unlock", scr_unlock_me, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.validateQuests]=add_cutscene_script("validateQuests", scr_validate_quests, VariableTypes.no, "[option]", -VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.wait]=add_cutscene_script("wait", scr_wait, VariableTypes.no, "seconds", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.walk]=add_cutscene_script("walk", scr_walk, VariableTypes.no, "speed", VariableTypes.float, "[direction]", -VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.walkToWaypoint]=add_cutscene_script("walkToWaypoint", scr_walk_to_waypoint, VariableTypes.no, "targetPackage", VariableTypes.package, "target", VariableTypes.entity, "speed", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.weather]=add_cutscene_script("weather", scr_weather, VariableTypes.no, "weather", VariableTypes.weather);
all_cutscene_scripts[CutsceneScripts.sysFlipHorizontal]=add_cutscene_script("sysFlipHorizontal", scr_sys_flip_horizontal, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.sysFlipVertical]=add_cutscene_script("sysFlipVertical", scr_sys_flip_vertical, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.sysSave]=add_cutscene_script("sysSave", scr_sys_save, VariableTypes.no, "slot", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.sysLoad]=add_cutscene_script("sysLoad", scr_sys_load, VariableTypes.no, "slot", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.sysQuoteRandomize]=add_cutscene_script("sysQuoteRandomize", scr_sys_quote_randomize, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.sysQuoteShow]=add_cutscene_script("sysQuoteShow", scr_sys_quote_show, VariableTypes.no, "show?", VariableTypes.boolean, "color", VariableTypes.color);

all_cutscene_scripts[CutsceneScripts.getCurrency]=add_cutscene_script("getCurrency", scr_GetMoney, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getRandomPercent]=add_cutscene_script("getRandomPercent", scr_GetRandomPercent, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getCurrentSeason]=add_cutscene_script("getCurrentSeason", scr_GetCurrentSeason, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getHasAchievement]=add_cutscene_script("getHasAchievement", scr_GetHasAch, VariableTypes.boolean, "achievement", VariableTypes.achievement);
all_cutscene_scripts[CutsceneScripts.getHasCompletedQuest]=add_cutscene_script("getHasCompletedQuest", scr_GetHasCompletedQuest, VariableTypes.boolean, "quest", VariableTypes.quest);
all_cutscene_scripts[CutsceneScripts.getHasItem]=add_cutscene_script("getHasItem", scr_GetHasItem, VariableTypes.boolean, "package", VariableTypes.package, "item", VariableTypes.item);

all_cutscene_scripts[CutsceneScripts.getHasStartedQuest]=add_cutscene_script("getHasStartedQuest", scr_GetHasStartedQuest, VariableTypes.boolean, "quest", VariableTypes.quest);
all_cutscene_scripts[CutsceneScripts.getInputString]=add_cutscene_script("getInputString", scr_GetInputString, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getInputStringEqualsPassword]=add_cutscene_script("getInputStringEqualsPassword", scr_GetInputStringEqualsPassword, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getInventorySize]=add_cutscene_script("getInventorySize", scr_GetInventorySize, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getIsAfternoon]=add_cutscene_script("getIsAfternoon", scr_GetIsAfternoon, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getIsEvening]=add_cutscene_script("getIsEvening", scr_GetIsEvening, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getIsFollowingPlayer]=add_cutscene_script("getIsFollowingPlayer", scr_GetIsFollowingPlayer, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getIsMorning]=add_cutscene_script("getIsMorning", scr_GetIsMorning, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getIsNight]=add_cutscene_script("getIsNight", scr_GetIsNight, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getItemVendorQuantity]=add_cutscene_script("getItemVendorQuantity", scr_GetItemVendorQuantity, VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.getMultipleChoice]=add_cutscene_script("getMultipleChoice", scr_GetMultipleChoice, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getMultipleChoiceOverQuit]=add_cutscene_script("getMultipleChoiceOverQuit", scr_GetMultipleChoiceOverQuit, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getMyDirectionFix]=add_cutscene_script("getMyDirectionFix", scr_GetMyDirectionFix, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.getMyItemName]=add_cutscene_script("getMyItemName", scr_GetMyItemName, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getMyItemNameIndefinite]=add_cutscene_script("getMyItemNameIndefinite", scr_GetMyItemNameIndefinite, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getMyItemnamePlural]=add_cutscene_script("getMyItemnamePlural", scr_GetMyItemNamePlural, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getMyItemNameQuantity]=add_cutscene_script("getMyItemNameQuantity", scr_GetMyItemNameQuantity, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getMyItemQuantity]=add_cutscene_script("getMyItemQuantity", scr_GetMyItemQuantity, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getMyVarKey]=add_cutscene_script("getMyVarKey", scr_GetMyVarKey, VariableTypes.item);
all_cutscene_scripts[CutsceneScripts.getMyName]=add_cutscene_script("getMyName", scr_GetMyName, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getMyText]=add_cutscene_script("getMyText", scr_GetMyText, VariableTypes.str);
all_cutscene_scripts[CutsceneScripts.getMyValue]=add_cutscene_script("getMyValue", scr_GetMyValue, VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.getX]=add_cutscene_script("getX", scr_GetX, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getY]=add_cutscene_script("getY", scr_GetY, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getZ]=add_cutscene_script("getZ", scr_GetZ, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getDirection]=add_cutscene_script("getDirection", scr_GetDirection, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getPitch]=add_cutscene_script("getPitch", scr_GetPitch, VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.getQuestCompleted]=add_cutscene_script("getQuestCompleted", scr_GetQuestCompleted, VariableTypes.boolean, "quest", VariableTypes.quest);
all_cutscene_scripts[CutsceneScripts.getQuestStage]=add_cutscene_script("getQuestStage", scr_GetQuestStage, VariableTypes.boolean, "quest", VariableTypes.quest);
all_cutscene_scripts[CutsceneScripts.getQuestText]=add_cutscene_script("getQuestText", scr_GetQuestText, VariableTypes.str, "quest", VariableTypes.quest);
all_cutscene_scripts[CutsceneScripts.moveToMoon]=add_cutscene_script("moveToMoon", scr_MoveToMoon, VariableTypes.no, "targetPackage", VariableTypes.package, "target", VariableTypes.entity);
all_cutscene_scripts[CutsceneScripts.lerpToMoon]=add_cutscene_script("lerpToMoon", scr_LerpToMoon, VariableTypes.no, "targetPackage", VariableTypes.package, "target", VariableTypes.entity);
all_cutscene_scripts[CutsceneScripts.effectParticleStatic]=add_cutscene_script("effectParticleStatic", scr_effect_particle_static, VariableTypes.effect, "model", VariableTypes.model, "index", VariableTypes.float, "duration", VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.ifbranch]=add_cutscene_script("if", scr_do_if, VariableTypes.no, "condition", VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.elsebranch]=add_cutscene_script("else", scr_else, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.endif]=add_cutscene_script("endif", scr_endif, VariableTypes.no);

all_cutscene_scripts[CutsceneScripts.entityAddCurrency]=add_cutscene_script("addCurrency", scr_entity_add_currency, VariableTypes.no, "amount", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.entityGetCurrency]=add_cutscene_script("getCurrency", scr_GetMyMoney, VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.giveMyItems]=add_cutscene_script("giveMyItems", scr_give_items, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.confuse]=add_cutscene_script("confuse", scr_confuse, VariableTypes.no, "time", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setAlive]=add_cutscene_script("setAlive", scr_set_alive, VariableTypes.no, "alive", VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.restoreHP]=add_cutscene_script("restoreHP", scr_restore_hp, VariableTypes.no, "amount", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.restoreMP]=add_cutscene_script("restoreMP", scr_restore_mp, VariableTypes.no, "amount", VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.getHealFull]=add_cutscene_script("getHealFull", scr_GetHealFull, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.removeMe]=add_cutscene_script("removeMe", scr_remove_me, VariableTypes.no);

all_cutscene_scripts[CutsceneScripts.getMobilePosition]=add_cutscene_script("getMobilePosition", scr_GetMobilePosition, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getMobileStyle]=add_cutscene_script("getMobileStyle", scr_GetMobileStyle, VariableTypes.interpolation_style);
all_cutscene_scripts[CutsceneScripts.getMobileActionSpeed]=add_cutscene_script("getMobileActionSpeed", scr_GetMobileActionSpeed, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getMobileEndAction]=add_cutscene_script("getMobileEndAction", scr_GetMobileEndAction, VariableTypes.mobile_end_action);
all_cutscene_scripts[CutsceneScripts.getMobileAbsolute]=add_cutscene_script("getMobileAbsolute", scr_GetMobileAbsolute, VariableTypes.boolean);
all_cutscene_scripts[CutsceneScripts.setMobilePosition]=add_cutscene_script("setMobilePosition", scr_set_mobile_position, VariableTypes.no, "position", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setMobileStyle]=add_cutscene_script("setMobileStyle", scr_set_mobile_style, VariableTypes.no, "style", VariableTypes.interpolation_style);
all_cutscene_scripts[CutsceneScripts.setMobileActionSpeed]=add_cutscene_script("setMobileActionSpeed", scr_set_mobile_action_speed, VariableTypes.no, "actionSpeed", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setMobileEndAction]=add_cutscene_script("setMobileEndAction", scr_set_mobile_end_action, VariableTypes.no, "endAction", VariableTypes.mobile_end_action);
all_cutscene_scripts[CutsceneScripts.setMobileAbsolute]=add_cutscene_script("setMobileAbsolute", scr_set_mobile_absolute, VariableTypes.no, "absolute?", VariableTypes.boolean);

all_cutscene_scripts[CutsceneScripts.getMobileActionAcceleration]=add_cutscene_script("getMobileActionAcceleration", scr_GetMobileActionAcceleration, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.getMobileActionSpeedMax]=add_cutscene_script("getMobileActionSpeedMax", scr_GetMobileActionSpeedMax, VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setMobileActionAcceleration]=add_cutscene_script("setMobileActionAcceleration", scr_set_mobile_action_acceleration, VariableTypes.no, "acceleration", VariableTypes.float);
all_cutscene_scripts[CutsceneScripts.setMobileActionSpeedMax]=add_cutscene_script("setMobileActionSpeedMax", scr_set_mobile_action_speed_max, VariableTypes.no, "maxSpeed", VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.sysCenterCursor]=add_cutscene_script("centerCursor", scr_sys_center_cursor, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.sysSetGameModePlay]=add_cutscene_script("setGameModePlay", scr_sys_set_mode_play, VariableTypes.no);
all_cutscene_scripts[CutsceneScripts.getVar]=add_cutscene_script("getVar", scr_GetVar, VariableTypes.any, "index", VariableTypes.float);

all_cutscene_scripts[CutsceneScripts.set2D]=add_cutscene_script("set2D", scr_camera_2d, VariableTypes.no, "plane", VariableTypes.camera_plane);
all_cutscene_scripts[CutsceneScripts.set3D]=add_cutscene_script("set3D", scr_camera_3d, VariableTypes.no);

enum CutsceneScriptEffects {
    CSEComet,
    CSEEffectBallFire,
    CSEEffectBallLightning,
    CSEEffectConfusion,
    CSEEffectExplosion,
    CSEEffectGenericBlob,
    CSEEffectIceSpike,
    CSEEffectShoveBlob,
    CSEEffectUFOHalo,
    CSEEffectWaterRing,
    CSEHUDOverlayEmote,
    CSEHUDOverlayText,
    CSEParticle,
    CSEParticleEmitterFire,
    CSEParticleFadingImage,
    CSEParticleOrbital,
    CSEParticleSpriteFace,
}

globalvar all_cutscene_script_effects;
all_cutscene_script_effects=array_add(CutsceneScriptEffects.CSEParticleSpriteFace, noone);

all_cutscene_script_effects[CutsceneScriptEffects.CSEComet]=Comet;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectBallFire]=EffectBallFire;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectBallLightning]=EffectBallLightning;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectConfusion]=EffectConfusion;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectExplosion]=EffectExplosion;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectGenericBlob]=EffectGenericBlob;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectIceSpike]=EffectIceSpike;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectShoveBlob]=EffectShoveBlob;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectUFOHalo]=EffectUFOHalo;
all_cutscene_script_effects[CutsceneScriptEffects.CSEEffectWaterRing]=EffectWaterRing;
all_cutscene_script_effects[CutsceneScriptEffects.CSEHUDOverlayEmote]=HUDOverlayEmote;
all_cutscene_script_effects[CutsceneScriptEffects.CSEHUDOverlayText]=HUDOverlayText;
all_cutscene_script_effects[CutsceneScriptEffects.CSEParticle]=Particle;
all_cutscene_script_effects[CutsceneScriptEffects.CSEParticleEmitterFire]=ParticleEmitterFire;
all_cutscene_script_effects[CutsceneScriptEffects.CSEParticleFadingImage]=ParticleFadingImage;
all_cutscene_script_effects[CutsceneScriptEffects.CSEParticleOrbital]=ParticleOrbital;
all_cutscene_script_effects[CutsceneScriptEffects.CSEParticleSpriteFace]=ParticleSpriteFace;

enum CutsceneScriptMovementScripts {
    flyForwards,
}

globalvar all_cutscene_script_movement_scripts;
all_cutscene_script_movement_scripts=array_add(CutsceneScriptMovementScripts.flyForwards, noone);

all_cutscene_script_movement_scripts[CutsceneScriptMovementScripts.flyForwards]=movement_fly_forwards;

enum CutsceneScriptPlayerGenders {
    male,
    female,
    owl,
}

globalvar all_cutscene_script_player_genders;
all_cutscene_script_player_genders=array_add(CutsceneScriptPlayerGenders.owl, noone);

all_cutscene_script_player_genders[CutsceneScriptPlayerGenders.male]="Male";
all_cutscene_script_player_genders[CutsceneScriptPlayerGenders.female]="Female";
all_cutscene_script_player_genders[CutsceneScriptPlayerGenders.owl]="Owl";

globalvar all_cutscenes, cutscene_map;
all_cutscenes=ds_list_create();
cutscene_map=ds_map_create();

var buffer=buffer_load('.\cutscenes.vcs');
var n=buffer_read(buffer, buffer_f32);

repeat(n){
    var map=ds_map_create();
    ds_map_read(map, buffer_read(buffer, buffer_string));
    var cutscene=instantiate(Cutscene, map[? "name"]);
    // cutscene_id is randomly generated and assigned to cutscene_map
    // in Cutscene's Create event, so it has to be deleted here
    ds_map_delete(cutscene_map, cutscene.cutscene_id);
    if (ds_map_exists(map, "id")){
        cutscene.cutscene_id=map[? "id"];
    }
    ds_map_add(cutscene_map, cutscene.cutscene_id, cutscene);
    cutscene.summary=map[? "summary"];
    ds_map_destroy(map);
    ds_list_clear(cutscene.code);
    ds_list_read(cutscene.code, buffer_read(buffer, buffer_string));
}
buffer_delete(buffer);

cutscene_eval_functions=ds_map_create();
cutscene_eval_functions[? "sin"]=scr_eval_sin;
cutscene_eval_functions[? "cos"]=scr_eval_cos;
cutscene_eval_functions[? "tan"]=scr_eval_tan;
cutscene_eval_functions[? "pow"]=scr_eval_power;
cutscene_eval_functions[? "min"]=scr_eval_min;
cutscene_eval_functions[? "max"]=scr_eval_max;
cutscene_eval_functions[? "floor"]=scr_eval_floor;
cutscene_eval_functions[? "ceil"]=scr_eval_ceil;
cutscene_eval_functions[? "random"]=scr_eval_random;
cutscene_eval_functions[? "logn"]=scr_eval_logn;
cutscene_eval_functions[? "!"]=scr_eval_bool_not;

cutscene_eval_function_arguments=ds_map_create();
cutscene_eval_function_arguments[? "sin"]=1;
cutscene_eval_function_arguments[? "cos"]=1;
cutscene_eval_function_arguments[? "tan"]=1;
cutscene_eval_function_arguments[? "pow"]=2;
cutscene_eval_function_arguments[? "min"]=2;
cutscene_eval_function_arguments[? "max"]=2;
cutscene_eval_function_arguments[? "floor"]=1;
cutscene_eval_function_arguments[? "ceil"]=1;
cutscene_eval_function_arguments[? "random"]=1;
cutscene_eval_function_arguments[? "logn"]=2;
cutscene_eval_function_arguments[? "!"]=1;

cutscene_eval_operators=ds_map_create();
cutscene_eval_operators[? "+"]=2;
cutscene_eval_operators[? "-"]=2;
cutscene_eval_operators[? "*"]=3;
cutscene_eval_operators[? "/"]=3;
cutscene_eval_operators[? "=="]=1;
cutscene_eval_operators[? "!="]=1;
cutscene_eval_operators[? ">="]=1;
cutscene_eval_operators[? "<="]=1;
cutscene_eval_operators[? ">"]=1;
cutscene_eval_operators[? "<"]=1;
cutscene_eval_operators[? "&&"]=1;
cutscene_eval_operators[? "||"]=1;
cutscene_eval_operators[? "^^"]=1;

cutscene_eval_operator_operations=ds_map_create();
cutscene_eval_operator_operations[? "+"]=scr_eval_operator_add;
cutscene_eval_operator_operations[? "-"]=scr_eval_operator_subtract;
cutscene_eval_operator_operations[? "*"]=scr_eval_operator_multiply;
cutscene_eval_operator_operations[? "/"]=scr_eval_operator_divide;
cutscene_eval_operator_operations[? "=="]=scr_eval_bool_equals;
cutscene_eval_operator_operations[? "!="]=scr_eval_bool_not_equals;
cutscene_eval_operator_operations[? ">="]=scr_eval_bool_greater_or_equals;
cutscene_eval_operator_operations[? "<="]=scr_eval_bool_less_or_equals;
cutscene_eval_operator_operations[? ">"]=scr_eval_bool_greater;
cutscene_eval_operator_operations[? "<"]=scr_eval_bool_less;
cutscene_eval_operator_operations[? "&&"]=scr_eval_bool_and;
cutscene_eval_operator_operations[? "||"]=scr_eval_bool_or;
cutscene_eval_operator_operations[? "^^"]=scr_eval_bool_xor;

/*cutscene_eval_boolean_operators=ds_map_create();
cutscene_eval_boolean_operators[? "=="]=2;
cutscene_eval_boolean_operators[? "!="]=2;
cutscene_eval_boolean_operators[? ">="]=2;
cutscene_eval_boolean_operators[? "<="]=2;
cutscene_eval_boolean_operators[? ">"]=2;
cutscene_eval_boolean_operators[? "<"]=2;
cutscene_eval_boolean_operators[? "&&"]=2;
cutscene_eval_boolean_operators[? "||"]=2;
cutscene_eval_boolean_operators[? "^^"]=2;

cutscene_eval_boolean_operator_operations=ds_map_create();
cutscene_eval_boolean_operator_operations[? "=="]=scr_eval_bool_equals;
cutscene_eval_boolean_operator_operations[? "!="]=scr_eval_bool_not_equals;
cutscene_eval_boolean_operator_operations[? ">="]=scr_eval_bool_greater_or_equals;
cutscene_eval_boolean_operator_operations[? "<="]=scr_eval_bool_less_or_equals;
cutscene_eval_boolean_operator_operations[? ">"]=scr_eval_bool_greater;
cutscene_eval_boolean_operator_operations[? "<"]=scr_eval_bool_less;
cutscene_eval_boolean_operator_operations[? "&&"]=scr_eval_bool_and;
cutscene_eval_boolean_operator_operations[? "||"]=scr_eval_bool_or;
cutscene_eval_boolean_operator_operations[? "^^"]=scr_eval_bool_xor;

cutscene_eval_boolean_functions=ds_map_create();
cutscene_eval_boolean_functions[? "!"]=scr_eval_bool_not;*/

enum CompilerStates {
    fine,
    warning,
    error,
}

cutscene_compiler_state_colors[CompilerStates.fine]=c_white;
cutscene_compiler_state_colors[CompilerStates.warning]=c_yellow;
cutscene_compiler_state_colors[CompilerStates.error]=c_pink;
