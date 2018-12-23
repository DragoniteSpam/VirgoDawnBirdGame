enum Misc {
    // these need to be first because light indices have to be 0..7
    // and I did not know that prior to putting these in the Misc enum
    sun,
    camera,
    // these are unordered
    te_raise,
    te_average,
    te_average_up,
    te_average_down,
    te_average_min,
    te_paint,
    te_paint_auto,
    te_modify,
    te_both,
    watch_running,
    watch_paused,
    watch_zero,
    equal,
    greater,
    less,
    greater_equal,
    less_equal,
    not_equal,
    front,
    back,
    OR,
    AND,
    open,
    closed,
    light_camera_straight,
    rotate_axis_x,
    rotate_axis_y,
    rotate_axis_z,
    geo_get_tex_top,
    geo_get_tex_side,
    imperial,
    metric,
    pokedex_start,
    pokedex_main,
    pokedex_number,
    pokedex_name,
    none,
    debug_main,
    debug_weather,
    debug_input,
    debug_world_variables,
    debug_instances,
    debug_random_stats,
    debug_player_stats,
    debug_internal_stats,
    title_main,
    title_delete,
    title_load,
    speech_bubble_speech,
    speech_bubble_thought,
    journal_quests_title,
    journal_quests_active,
    journal_quests_complete,
    journal_quests_back,
    dragonfly_static,
    dragonfly_mobile,
    clockwise,
    counterclockwise,
    feed,
    water,
    empty,
    small,
    large,
    edit_generation_point1,
    edit_generation_point2,
    edit_generation_off,
    d3d_model,
    vertex_buffer,
    block,
    model,
    wireframe,
    model_and_wireframe,
    // Combat states
    begin_combat,
    charging,
    preparing,
    attacking,
    idle,
    attacking_meta,
    cooking_a,
    cooking_b,
    up,
    down,
    sproing_eq_2,
    sproing_eq_4,
    // Map navigation
    map_navigate,
    map_ft_confirm,
    map_ft_cant,
    // Handedness (and other things)
    right,
    left,
    // Database overlays
    edit_db_overlay_none,
    edit_db_overlay_item_icon,
    edit_db_overlay_item_equip_graphic,
    edit_db_overlay_item_equip_effect,
    edit_db_overlay_item_effect,
    edit_db_overlay_item_pocket,
    edit_db_overlay_item_model,
    edit_db_overlay_model_archive,
    edit_db_overlay_model_color,
    edit_db_overlay_model_hit_script,
    edit_db_overlay_model_collision,
    edit_db_overlay_model_visible,
    edit_db_overlay_ag_entry_song,
    edit_db_overlay_ag_entry_new,
    edit_db_overlay_bgm_bgm,
    // File pages
    edit_file_page_default,
    edit_file_page_mod_select,
}

enum Editor {
    def,
    entity,
    fountain,
    item,
    npc,
    toilet,
    door,
    teleport,
    card,
    signpost,
    fire,
    blank,
    clock,
    death,
    animal,
    windmill,
    chest,
    door_password,
    bowl,
    event,
    collectable,
    lamp,
    combat,
    stats,
    bulb,
    sproing,
    cooking,
    pressureplate,
    emitter,
    wrecking_ball,
    npc_respawn,
    movement,
    heart,
    hit_sides,
    npc_walls,
}

enum Sides {
    left,
    right,
}

enum MovementStates {
    still,
    walking,
    running,
    biking,
    surfing,
    flying,
    battling,
}

movement_state_name[MovementStates.still]=get_text(Text.msStill);
movement_state_name[MovementStates.walking]=get_text(Text.msWalking);
movement_state_name[MovementStates.running]=get_text(Text.msRunning);
movement_state_name[MovementStates.biking]=get_text(Text.msBiking);
movement_state_name[MovementStates.surfing]=get_text(Text.msSurfing);
movement_state_name[MovementStates.flying]=get_text(Text.msFlying);

enum GameModes {
    none,
    edit_object,   // objects, object settings, preset objects
    edit_event,    // events, random encountere data, items, npcs
    edit_generation,    // automatic placement of things like trees, etc
    edit_settings,
    edit_text,
    edit_game,
    edit_inventory,
    edit_quest,
    edit_all,
    edit_cutscene,
    edit_database,
    edit_file,
    play,
    animal,
    console,
    title,
    gameover,
}

game_mode_name[GameModes.edit_object]=get_text(Text.gmEditObject);
game_mode_name[GameModes.edit_event]=get_text(Text.gmEditEvent);
game_mode_name[GameModes.edit_generation]=get_text(Text.gmEditGeneration);
game_mode_name[GameModes.edit_settings]=get_text(Text.gmEditMap);
game_mode_name[GameModes.edit_file]=get_text(Text.gmEditFile);
game_mode_name[GameModes.edit_game]=get_text(Text.gmEditGame);
game_mode_name[GameModes.edit_inventory]=get_text(Text.gmEditInventory);
game_mode_name[GameModes.edit_quest]=get_text(Text.gmEditQuest);
game_mode_name[GameModes.edit_cutscene]=get_text(Text.gmEditCutscene);
game_mode_name[GameModes.edit_text]=get_text(Text.gmEditText);
game_mode_name[GameModes.edit_all]=get_text(Text.gmEditAll);
game_mode_name[GameModes.edit_database]=get_text(Text.gmEditDatabase);
game_mode_name[GameModes.play]=get_text(Text.gmPlay);
game_mode_name[GameModes.animal]=get_text(Text.gmAnimal);
game_mode_name[GameModes.console]=get_text(Text.gmConsole);
game_mode_name[GameModes.title]=get_text(Text.gmTitle);
game_mode_name[GameModes.gameover]=get_text(Text.gmGameOver);

game_mode_draw_world[GameModes.edit_object]=true;
game_mode_draw_world[GameModes.edit_event]=true;
game_mode_draw_world[GameModes.edit_generation]=true;
game_mode_draw_world[GameModes.edit_settings]=true;
game_mode_draw_world[GameModes.edit_file]=true;
game_mode_draw_world[GameModes.edit_game]=false;
game_mode_draw_world[GameModes.edit_inventory]=false;
game_mode_draw_world[GameModes.edit_quest]=false;
game_mode_draw_world[GameModes.edit_cutscene]=false;
game_mode_draw_world[GameModes.edit_text]=false;
game_mode_draw_world[GameModes.edit_database]=false;
game_mode_draw_world[GameModes.edit_all]=true;
game_mode_draw_world[GameModes.play]=true;
game_mode_draw_world[GameModes.animal]=true;
game_mode_draw_world[GameModes.console]=false;
game_mode_draw_world[GameModes.title]=true;
game_mode_draw_world[GameModes.gameover]=true;

game_mode_is_debug[GameModes.edit_object]=true;
game_mode_is_debug[GameModes.edit_event]=true;
game_mode_is_debug[GameModes.edit_generation]=true;
game_mode_is_debug[GameModes.edit_settings]=true;
game_mode_is_debug[GameModes.edit_file]=true;
game_mode_is_debug[GameModes.edit_game]=true;
game_mode_is_debug[GameModes.edit_inventory]=true;
game_mode_is_debug[GameModes.edit_quest]=true;
game_mode_is_debug[GameModes.edit_cutscene]=true;
game_mode_is_debug[GameModes.edit_text]=true;
game_mode_is_debug[GameModes.edit_all]=true;
game_mode_is_debug[GameModes.edit_database]=true;
game_mode_is_debug[GameModes.play]=false;
game_mode_is_debug[GameModes.animal]=false;
game_mode_is_debug[GameModes.console]=true;
game_mode_is_debug[GameModes.title]=false;
game_mode_is_debug[GameModes.gameover]=false;

enum CameraPOV {
    cam_first,
    cam_third,
    cam_free,
    cam_title,
    cam_edit_top,
    cam_2d,
}

// all this so you can jump higher in 2D mode than 3D

cam_pov_jump_factor=array_create(CameraPOV.cam_2d);
array_clear(cam_pov_jump_factor, 1);
cam_pov_jump_factor[CameraPOV.cam_2d]=2;

// Don't screw with the order these are defined in, since they're saved to and loaded from files.
enum Database {
    items,                      //
    models,                     //
    audio_groups,               //
    bgm,                        //
    npcs,                       //
    recipes,
    item_effects,
    maps,
    pressure_plate_actions,
    final
}

// no globalvar here because it should probably only be accessed in one place
database_readers=array_create(Database.final);
database_readers[Database.items]=database_read_items;
database_readers[Database.models]=database_read_models;
database_readers[Database.audio_groups]=database_read_audio_groups;
database_readers[Database.bgm]=database_read_bgm;
database_readers[Database.npcs]=database_read_npc;
database_readers[Database.recipes]=database_read_recipe;
database_readers[Database.item_effects]=database_read_item_effects;
database_readers[Database.maps]=database_read_maps;
database_readers[Database.pressure_plate_actions]=database_read_pressure_plate_actions;

// these are bitwise flags so they need to be powers of two
enum DatabaseErrors {
    no=0,
    missing_mod=1,
}

enum vec4 {
    r, g, b, a
}

enum vec3 {
    xx, yy, zz
}

enum Genders {
    male,
    female,
    owl,
    genderless,
    both,
}

globalvar gender_names, gender_hisher, gender_himher, gender_heshe;

gender_names[Genders.male]=get_text(Text.txtGenMale);
gender_names[Genders.female]=get_text(Text.txtGenFemale);
gender_names[Genders.genderless]=get_text(Text.txtGenderless);
gender_names[Genders.both]=get_text(Text.txtGenBoth);

gender_hisher[Genders.male]=get_text(Text.txtGenHis);
gender_hisher[Genders.female]=get_text(Text.txtGenHer);
gender_hisher[Genders.genderless]=get_text(Text.txtGenIts);
gender_hisher[Genders.both]=get_text(Text.txtGenTheir);

gender_himher[Genders.male]=get_text(Text.txtGenHim);
gender_himher[Genders.female]=get_text(Text.txtGenHer);
gender_himher[Genders.genderless]=get_text(Text.txtGenIt);
gender_himher[Genders.both]=get_text(Text.txtGenThey);

gender_heshe[Genders.male]=get_text(Text.txtGenHe);
gender_heshe[Genders.female]=get_text(Text.txtGenShe);
gender_heshe[Genders.genderless]=get_text(Text.txtGenIt);
gender_heshe[Genders.both]=get_text(Text.txtGenThey);

enum ModelData {
    xx,
    yy,
    zz,
    nx,
    ny,
    nz,
    xtex,
    ytex,
    color,
    alpha
}

enum ModelFormats {
    d3d_model,
    vertex_buffer
}

globalvar model_format_names;
model_format_names[ModelFormats.vertex_buffer]="Vertex Buffer";
model_format_names[ModelFormats.d3d_model]="D3D Model";

enum CompassPoints {
    None,
    Ball,
    Blank,
    Icon,
    Default,
}

globalvar compass_point_names, compass_point_pictures;

compass_point_names[CompassPoints.None]='None';
compass_point_names[CompassPoints.Ball]='Baseball';
compass_point_names[CompassPoints.Blank]='Blank';
compass_point_names[CompassPoints.Icon]='Icon';
compass_point_names[CompassPoints.Default]='Default';

compass_point_pictures[CompassPoints.None]=b_cp_ball;
compass_point_pictures[CompassPoints.Ball]=b_cp_ball;
compass_point_pictures[CompassPoints.Blank]=b_cp_blank;
compass_point_pictures[CompassPoints.Icon]=b_cp_icon;
compass_point_pictures[CompassPoints.Default]=b_cp_default;

enum InterpolationStyles {
    smooth,
    interpolate,
    bezier,
}

globalvar interpolation_style_names;

interpolation_style_names[InterpolationStyles.interpolate]="Interpolate";
interpolation_style_names[InterpolationStyles.smooth]="Smooth";
interpolation_style_names[InterpolationStyles.bezier]="Bezier";

enum MobileEndActions {
    stop,
    reverse,
    restart,
}

globalvar mobile_end_action_names;

mobile_end_action_names[MobileEndActions.stop]="Stop";
mobile_end_action_names[MobileEndActions.reverse]="Reverse";
mobile_end_action_names[MobileEndActions.restart]="Restart";
