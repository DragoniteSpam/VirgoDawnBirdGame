#define const_model
const_model_enum();

enum ModelSaveTypes {
    general,
    header,
}

enum ParticleColors {
    YELLOW, ORANGE, BRONZE, BLUE, BLUE2, PURPLE, GREEN, GREEN2, GRAY, GRAY2, WHITE, BLACK, RED,
}

enum FeatherColors {
    F0, F1, F2, F3, F4
}

const_model_load_vra('.\models\assets.vra', ModelFormats.d3d_model, true);
const_model_load_vra('.\models\compound.vra', ModelFormats.vertex_buffer, true);
const_model_load_vra('.\models\geometry.vra', ModelFormats.vertex_buffer, true);
const_model_load_vra('.\models\extra.vra', ModelFormats.d3d_model, true);
const_model_load_vra('.\models\particles.vra', ModelFormats.d3d_model, true);
const_model_load_vra('.\models\gramme.vra', ModelFormats.d3d_model, true);

var fn=file_find_first(MOD_DIRECTORY+'\*.vra', 0);
while (fn!=''){
    // @todo At some point embed the 'format' data in the file itself?
    const_model_load_vra(MOD_DIRECTORY+'\'+fn, ModelFormats.d3d_model, false);
    fn=file_find_next();
}
file_find_close();

// Unfiled models for special purposes

// These can't go in an archive, for one reason or another
model_sphere=d3d_model_create();
d3d_model_load(model_sphere, '.\models\extra\sphere.d3d');
model_rain=d3d_model_create();
d3d_model_load(model_rain, '.\models\extra\rain.d3d');

// Collision masks?

globalvar c_collision, c_collision_event;
var r=4;

var c_collision_shape=c_shape_create();
c_transform_position(0, 0, r);
c_shape_add_sphere(c_collision_shape, r);
c_transform_identity();
c_collision=c_object_create(c_collision_shape, 1, COLLISION_PRIMARY);
c_collision_event=c_object_create(c_collision_shape, 1, COLLISION_EVENT);

// Coded stuff

model_water_triangles=0;
//model_water=add_model_water();
//model_water_top=add_model_water_top();

var rep=500;
var dist=10000;
model_water = d3d_model_create();
d3d_model_primitive_begin(model_water, pr_trianglestrip);
d3d_model_vertex_texture(model_water, dist, -dist, 0, rep, 0);
d3d_model_vertex_texture(model_water, dist, dist, 0, rep, rep);
d3d_model_vertex_texture(model_water, -dist, -dist, 0, 0, 0);
d3d_model_vertex_texture(model_water, -dist, dist, 0, 0, rep);
d3d_model_primitive_end(model_water);

/*var water_surface=surface_create(256, 256);
surface_set_target(water_surface);

//clear the surface with a dark gray, to set the stage for the rest of the effect
draw_clear(c_dkgray);

//use this custom blend mode to overlay a bunch of layers of noise
draw_set_blend_mode_ext(bm_dest_color, bm_dest_color);

//draw the noise layers
draw_background_tiled_ext(b_noise_16,  0,    0,   16,  16, c_white, 0.125);
draw_background_tiled_ext(b_noise_32,  0,    0,   8,   8,  c_white, 0.125);
draw_background_tiled_ext(b_noise_64,  0,    0,   4,   4,  c_white, 0.125);
draw_background_tiled_ext(b_noise_128, 0,    0,   2,   2,  c_white, 0.125);
draw_background_tiled_ext(b_noise_4,   0,    0,   64,  64, c_white, 0.125);
draw_background_tiled_ext(b_noise_16,  0,    0,   16,  16, c_white, 0.125);
draw_background_tiled_ext(b_noise_8,   0,    0,   32,  32, c_white, 0.125);

//reset the blend mode
draw_set_blend_mode(bm_normal);
    
//stop drawing to the surface
surface_reset_target();*/

//water_background=background_create_from_surface(water_surface, 0, 0, 256, 256, false, false);
water_texture=background_get_texture(b_water_texture);
//water_texture=background_get_texture(water_background);
texture_set_repeat(true);

//surface_free(water_surface);

instance_deactivate_object(VRAContainer);

var extra_container=get_vra_container_from_name("extra.vra", noone);
m_npc_cage=const_model_get('NPC_Cage', extra_container);
model_starbox=const_model_get('Starbox', extra_container);
model_sun=const_model_get('Sun', extra_container);

var container=get_vra_container_from_name('gramme.vra', noone);

all_clouds=ds_list_create();

ds_list_add(all_clouds, const_model_get("1", container));
ds_list_add(all_clouds, const_model_get("2", container));
ds_list_add(all_clouds, const_model_get("3", container));
ds_list_add(all_clouds, const_model_get("4", container));

mdl_viing=Models.extra_viing;
mdl_feather=Models.extra_feather;
mdl_card=Models.extra_card;
mdl_clock_hand_minute=Models.extra_clock_hand_minute;
mdl_clock_hand_hour=Models.extra_clock_hand_hour;
mdl_npc=Models.extra_npc;
mdl_confusion=Models.extra_confusion;
mdl_ufo_halo=Models.extra_ufo_halo;
mdl_hitzone=Models.extra_hitzone;
mdl_teleport_marker=Models.extra_teleport_marker;
mdl_heart=Models.extra_heart;

mdl_chest_top=Models.gen_chest_top;
mdl_baseball=Models.gen_baseball;
mdl_football=Models.gen_football;
mdl_arrow=Models.gen_arrow;
mdl_clock_gear_small=Models.gen_clock_gear_small;

mdl_ring=Models.part_ring;
mdl_ice_spike=Models.part_ice_spike;
mdl_aster=Models.part_aster;

#define const_model_enum
enum Models {
    none,
    PLACE_GENERAL,
    gen_house_door,
    gen_house_00,
    gen_house_01,
    gen_house_02,
    gen_house_03,
    gen_unused005,
    gen_unused006,
    gen_unused007,
    gen_unused008,
    gen_unused009,
    gen_temple,
    gen_sps,
    gen_house_door_tall,
    gen_library,
    gen_tavern,
    gen_tree_00,
    gen_skyscraper_00,
    gen_skyscraper_01,
    gen_church,
    gen_plant_00,
    gen_candle_a,
    gen_tree_01,
    gen_tree_02,
    gen_unused019,
    gen_unused020,
    gen_unused021,
    gen_pressureplate_stone,
    gen_pressureplate,
    gen_tool_broom,
    gen_tool_ladder,
    gen_tool_axe,
    gen_tool_pitchfork,
    gen_tool_pickaxe,
    gen_tool_staff,
    gen_tool_sword,
    gen_tool_test_teapot,
    gen_tool_scythe,
    gen_table,
    gen_table_chairs,
    gen_table_outdoors,
    gen_fountain,
    gen_chair,
    gen_lamp_street,
    gen_shelf,
    gen_chest,
    gen_chest_top,
    gen_bed,
    gen_toilet_b,
    gen_fence,
    gen_fence_half,
    gen_flowerpot_a,
    gen_flowerpot_b,
    gen_barrel,
    gen_crate_a,
    gen_crate_b,
    gen_skyscraper_spire,
    gen_log_pyre,
    gen_log,
    gen_log_pile,
    gen_gazebo,
    gen_bench_a,
    gen_bench_b,
    gen_sign_aviary,
    gen_sign_road,
    gen_sign_c,
    gen_sign_d,
    gen_campfire,
    gen_bridge_arch,
    gen_bridge_arch_end,
    gen_bridge_arch_middle,
    gen_bridge_arch_long,
    gen_pier,
    gen_notice_a,
    gen_notice_b,
    gen_notice_c,
    gen_notice_d,
    gen_barn_00,
    gen_unused030,
    gen_barn_door,
    gen_arrow,
    gen_bow,
    gen_stove,
    gen_tent,
    gen_cauldron,
    gen_cauldron_knock,
    gen_cabinet,
    gen_sink,
    gen_chair_soft,
    gen_sofa,
    gen_desk,
    gen_bird_hawk,
    gen_bird_goose,
    gen_slope,
    gen_weaponsrack,
    gen_collectable,
    gen_football,
    gen_baseball_bat,
    gen_baseball,
    gen_tombstone,
    gen_tombstone_w,
    gen_cross,
    gen_clock_gear,
    gen_clock_gear_small,
    gen_clocktower,
    gen_clock_pendulum,
    gen_bell,
    gen_unused044,
    gen_unused045,
    gen_book_pile,
    gen_book_stack,
    gen_underpass,
    gen_trapdoor,
    gen_unused048,
    gen_fossil_tr,
    gen_urn_a,
    gen_urn_b,
    gen_slope_dirt,
    gen_slope_bridge,
    gen_underground_bridge,
    gen_flowerpot_plant,
    gen_spiderweb,
    gen_haybale,
    gen_fence_b,
    gen_chickencoop,
    gen_flowerpot_wide,
    gen_barrel_b,
    gen_wagon,
    gen_rocka,
    gen_rockb,
    gen_rockc,
    gen_rockd,
    gen_rocke,
    gen_rockf,
    gen_rock_staff,
    gen_waterwell,
    gen_book_open,
    gen_aesthetic_box,
    gen_teleportstone,
    gen_flower_bulb,
    gen_flower_open_large,    gen_flower_open_small,
    gen_trampoline,
    gen_gloom,
    gen_wrecking_ball,    gen_wrecking_ball_base,   gen_wrecking_ball_body,
    gen_shield_wood_1,    gen_shield_wood_2,    gen_shield_wood_3,    gen_shield_wood_4,
    gen_shield_wood_5,    gen_shield_wood_6,    gen_shield_wood_7,    gen_shield_wood_8,
    gen_shield_wood_9,
    gen_shield_metal_10,    gen_shield_metal_11,    gen_shield_metal_12,    gen_shield_metal_13,
    gen_shield_metal_14,    gen_shield_metal_15,    gen_shield_metal_16,    gen_shield_metal_17,
    gen_shield_metal_18,
    gen_pew,
    gen_arc,
    gen_temple_rubble_a,
    gen_temple_rubble_b,
    gen_temple_pillar,
    gen_temple_pillar_broken,    gen_35,    gen_36,    gen_37,    gen_38,    gen_39,
    gen_40,    gen_41,    gen_42,    gen_43,    gen_44,    gen_45,    gen_46,    gen_47,    gen_48,    gen_49,
    gen_50,    gen_51,    gen_52,    gen_53,    gen_54,    gen_55,    gen_56,    gen_57,    gen_58,    gen_59,
    gen_60,    gen_61,    gen_62,    gen_63,    gen_64,    gen_65,    gen_66,    gen_67,    gen_68,    gen_69,
    gen_70,    gen_71,    gen_72,    gen_73,    gen_74,    gen_75,    gen_76,    gen_77,    gen_78,    gen_79,
    gen_80,    gen_81,    gen_82,    gen_83,    gen_84,    gen_85,    gen_86,    gen_87,    gen_88,    gen_89,
    gen_90,    gen_91,    gen_92,    gen_93,    gen_94,    gen_95,
    gen_castle2_layer0,
    gen_castle2_layer1,
    gen_98,    gen_99,
    gen_mansion_floor_0,
    gen_mansion_floor_1,
    gen_mansion_floor_2,
    gen_mansion_floor_3,
    gen_mansion_floor_4,
    gen_castle_floor_0,
    gen_castle_floor_1,
    gen_castle_floor_2,
    gen_castle_floor_3,
    gen_castle_door,
    gen_castle_door_big,
    gen_castle_platform,
    gen_castle_sloping_stairs,
    gen_castle_platform_mini,
    gen_castle_platform_mini_t,
    gen_football_field,
    gen_bleachers,
    gen_baseball_field,
    gen_test_block_64,
    gen_unused119,
    gen_cup,
    gen_bowl,
    gen_plate,
    gen_123,    gen_124,    gen_125,    gen_126,    gen_127,    gen_128,    gen_129,
    gen_130,    gen_131,    gen_132,    gen_133,    gen_134,    gen_135,    gen_136,    gen_137,    gen_138,    gen_139,
    gen_140,    gen_141,    gen_142,    gen_143,    gen_144,    gen_145,    gen_146,    gen_147,    gen_148,    gen_149,
    gen_150,    gen_151,    gen_152,    gen_153,    gen_154,    gen_155,    gen_156,    gen_157,    gen_158,    gen_159,
    gen_160,    gen_161,    gen_162,    gen_163,    gen_164,    gen_165,    gen_166,    gen_167,    gen_168,    gen_169,
    gen_170,    gen_171,    gen_172,    gen_173,    gen_174,    gen_175,    gen_176,    gen_177,    gen_178,    gen_179,
    gen_180,    gen_181,    gen_182,    gen_183,    gen_184,    gen_185,    gen_186,    gen_187,    gen_188,    gen_189,
    gen_190,    gen_191,    gen_192,    gen_193,    gen_194,    gen_195,    gen_196,    gen_197,    gen_198,    gen_199,
    gen_200,    gen_201,    gen_202,    gen_203,    gen_204,    gen_205,    gen_206,    gen_207,    gen_208,    gen_209,
    gen_210,    gen_211,    gen_212,    gen_213,    gen_214,    gen_215,    gen_216,    gen_217,    gen_218,    gen_219,
    gen_220,    gen_221,    gen_222,    gen_223,    gen_224,    gen_225,    gen_226,    gen_227,    gen_228,    gen_229,
    gen_230,    gen_231,    gen_232,    gen_233,    gen_234,    gen_235,    gen_236,    gen_237,    gen_238,    gen_239,
    gen_240,    gen_241,    gen_242,    gen_243,    gen_244,    gen_245,    gen_246,    gen_247,    gen_248,    gen_249,
    gen_250,    gen_251,    gen_252,    gen_253,    gen_254,    gen_255,    gen_256,    gen_257,    gen_258,    gen_259,
    gen_260,    gen_261,    gen_262,    gen_263,    gen_264,    gen_265,    gen_266,    gen_267,    gen_268,    gen_269,
    gen_270,    gen_271,    gen_272,    gen_273,    gen_274,    gen_275,    gen_276,    gen_277,    gen_278,    gen_279,
    gen_280,    gen_281,    gen_282,    gen_283,    gen_284,    gen_285,    gen_286,    gen_287,    gen_288,    gen_289,
    gen_290,    gen_291,    gen_292,    gen_293,    gen_294,    gen_295,    gen_296,    gen_297,    gen_298,    gen_299,
    gen_300,    gen_301,    gen_302,    gen_303,    gen_304,    gen_305,    gen_306,    gen_307,    gen_308,    gen_309,
    gen_310,    gen_311,    gen_312,    gen_313,    gen_314,    gen_315,    gen_316,    gen_317,    gen_318,    gen_319,
    gen_320,    gen_321,    gen_322,    gen_323,    gen_324,    gen_325,    gen_326,    gen_327,    gen_328,    gen_329,
    gen_330,    gen_331,    gen_332,    gen_333,    gen_334,    gen_335,    gen_336,    gen_337,    gen_338,    gen_339,
    gen_340,    gen_341,    gen_342,    gen_343,    gen_344,    gen_345,    gen_346,    gen_347,    gen_348,    gen_349,
    gen_350,    gen_351,    gen_352,    gen_353,    gen_354,    gen_355,    gen_356,    gen_357,    gen_358,    gen_359,
    gen_360,    gen_361,    gen_362,    gen_363,    gen_364,    gen_365,    gen_366,    gen_367,    gen_368,    gen_369,
    gen_370,    gen_371,    gen_372,    gen_373,    gen_374,    gen_375,    gen_376,    gen_377,    gen_378,    gen_379,
    gen_380,    gen_381,    gen_382,    gen_383,    gen_384,    gen_385,    gen_386,    gen_387,    gen_388,    gen_389,
    gen_390,    gen_391,    gen_392,    gen_393,    gen_394,    gen_395,    gen_396,
    gen_flat,
    gen_stage1_playtest,
    gen_test_level,
    // Compound instances.
    PLACE_COMPOUND,
    cmp_library_shelves,
    cmp_cave_exterior,
    cmp_cave_foliage,
    cmp_cave_smashing_body,
    cmp_cave_smashing_rocks,
    cmp_forest_trees_01,
    cmp_forest_trees_02,
    cmp_forest_decals,
    cmp_fence_patience_00,
    cmp_cemetary_patience_00,
    cmp_cemetary_patience_foliage,
    cmp_forest_clearing,
    cmp_mansion_trees,
    cmp_mansion_decals,
    cmp_cave_illumination,
    cmp_cave_illumination_hidden,
    cmp_cave_illumination_rocks,
    cmp_cave_illumination_exterior,
    cmp_18,    cmp_19,
    cmp_20,    cmp_21,    cmp_22,    cmp_23,    cmp_24,    cmp_25,    cmp_26,    cmp_27,    cmp_28,    cmp_29,
    cmp_30,    cmp_31,    cmp_32,    cmp_33,    cmp_34,    cmp_35,    cmp_36,    cmp_37,    cmp_38,    cmp_39,
    cmp_40,    cmp_41,    cmp_42,    cmp_43,    cmp_44,    cmp_45,    cmp_46,    cmp_47,    cmp_48,    cmp_49,
    // Geometry
    PLACE_GEOMETRY,
    geo_hill1,
    geo_hill2,
    geo_hill3,
    geo_hill4,
    geo_hill5,
    geo5,    geo6,    geo7,    geo8,    geo9,
    geo10,    geo11,    geo12,    geo13,    geo14,
    geo15,    geo16,    geo17,    geo18,    geo19,
    geo20,    geo21,    geo22,    geo23,    geo24,
    geo_flat0,
    geo_flat1,
    geo_flat2,
    geo28,    geo29,
    geo30,    geo31,    geo32,    geo33,    geo34,
    geo35,    geo36,    geo37,    geo38,    geo39,
    geo40,    geo41,    geo42,    geo43,    geo44,
    geo45,    geo46,    geo47,    geo48,    geo49,
    geo_sand1,
    geo_sand2,
    geo_sand3,
    geo53,    geo54,
    geo55,    geo56,    geo57,    geo58,    geo59,
    geo60,    geo61,    geo62,    geo63,    geo64,
    geo65,    geo66,    geo67,    geo68,    geo69,
    geo70,    geo71,    geo72,    geo73,    geo74,
    geo_level0,
    geo_level1,
    geo_level2,
    geo_level3,
    geo79,
    geo80,    geo81,    geo82,    geo83,    geo84,
    geo85,    geo86,    geo87,    geo88,    geo89,
    geo90,    geo91,    geo92,    geo93,    geo94,
    geo95,    geo96,    geo97,    geo98,    geo99,
    geo_wall00,
    geo_wall01,
    geo_wall02,
    geo_wall03,
    geo_wall04,
    geo_wall05,
    geo_wall06,
    geo_wall07,
    geo_cave_arch_01,
    geo_cave_arch_ns_01,
    geo_cave_arch_03,
    geo_cave_arch_04,
    geo_cave_arch_05,
    geo_cave_corner_01,
    geo_cave_corner_ns_01,
    geo_cave_corner_03,
    geo_cave_corner_04,
    geo_cave_corner_05,
    geo_cave_wall_01,
    geo_cave_wall_ns_01,
    geo_cave_wall_ns_02,
    geo_cave_wall_04,
    geo_cave_wall_05,
    geo_cave_pillar_large_01,
    geo_cave_pillar_large_02,
    geo_cave_pillar_large_03,
    geo_cave_pillar_large_04,
    geo_cave_pillar_large_05,
    geo_cave_pillar_small_01,
    geo_cave_pillar_small_02,
    geo_cave_pillar_small_03,
    geo_cave_step_walk_01,
    geo_cave_step_01,
    geo_cave_middle_01,
    geo_cave_middle_ns_01,
    geo_cave_middle_top_01,
    geo_cave_middle_top_ns_01,
    geo_cave_door_01,
    geo_castle_gate,
    geo_castle_tower,
    geo_castle_wall_01,
    geo_castle_wall_02,
    // Extra things. Probably shouldn't be instantiated.
    PLACE_EXTRA,
    extra_npc,
    extra_starbox,
    extra_sun,
    extra_card,
    extra_light_halo,
    extra_ufo_halo,
    extra_feather,
    extra_clock_hand_minute,
    extra_clock_hand_hour,
    extra_invisible_talky,
    extra_cylinder,
    extra_marker,
    extra_frog_tongue,
    extra_teleport_marker,
    extra_confusion,
    extra_viing,
    extra_testblock,
    extra_player,
    extra_heart,
    extra_hitzone,
    extra_11,    extra_12,    extra_13,
    extra_14,    extra_15,    extra_16,    extra_17,
    extra_18,    extra_19,    extra_1a,    extra_1b,
    extra_1c,    extra_1d,    extra_1e,    extra_1f,
    // These are also uninstantiated. Or if you instantiate them, you might get errors.
    PLACE_PARTICLE,
    part_aster,
    part_shard,
    part_ring,
    part_feather,
    part_flower,
    part_wood,
    effect_teleport,
    effect_cone,
    part_ice_shard,
    part_ice_spike,
    part_lightning,
    part_portal,
    part_portal_ring,
}

#define const_model_load_vra
/// VRAContainer const_model_load_vra(filename, [format], [base archive]);

with (instantiate(VRAContainer)){
    name=filename_name(argument[0]);
    
    ds_map_add(World.all_vra_containers_map, name, id);
    
    var buffer=buffer_load(argument[0]);
    var n=buffer_read(buffer, T);
    
    switch (argument_count){
        case 3:
            base_archive=argument[2];
        case 2:
            format=argument[1];
            break;
    }
    
    repeat(n){
        var model_name=buffer_read_string(buffer);
        if (string_copy(model_name, 1, 2)=="C_"){
            hash[? model_name]=const_model_collision_next(buffer, format);
            block_hash[? model_name]=block_model;
        } else {
            hash[? model_name]=const_model_next(buffer, format);
        }
    }
    buffer_delete(buffer);
    return id;
}

#define const_model_next
/// d3d const_model_next(buffer, format);

var n=buffer_read(argument0, T);

if (argument1==ModelFormats.d3d_model){
    var model=d3d_model_create();
    d3d_model_primitive_begin(model, pr_trianglelist);
} else {
    var buffer=vertex_create_buffer();
    vertex_begin(buffer, World.vertex_format_default);
}
repeat(n){
    var xx=buffer_read(argument0, T);
    var yy=buffer_read(argument0, T);
    var zz=buffer_read(argument0, T);
    var nx=buffer_read(argument0, T);
    var ny=buffer_read(argument0, T);
    var nz=buffer_read(argument0, T);
    var xtex=buffer_read(argument0, T);
    var ytex=buffer_read(argument0, T);
    var color=buffer_read(argument0, T);
    var alpha=buffer_read(argument0, T);
    if (argument1==ModelFormats.d3d_model){
        d3d_model_vertex_normal_texture_colour(model, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
    } else {
        vertex_position_3d(buffer, xx, yy, zz);
        vertex_normal(buffer, nx, ny, nz);
        vertex_texcoord(buffer, xtex, ytex);
        vertex_colour(buffer, color, alpha);
    }
}

if (argument1==ModelFormats.d3d_model){
    d3d_model_primitive_end(model);    
    return model;
} else {
    vertex_end(buffer);
    vertex_freeze(buffer);
    return buffer;
}

#define const_model_collision_next
/// d3d const_model_collision_next(buffer, format);

var n=buffer_read(argument0, T);

var model=c_shape_create();
c_shape_begin_trimesh();
var xx, yy, zz, nx, ny, nz, col, alpha;
// Don't destroy or clear the models or anything. they need to continue existing, as to be
// accessed in the future when F9 is pressed and when saving compound collision models
if (argument1==ModelFormats.d3d_model){
    block_model=d3d_model_create();
    d3d_model_primitive_begin(block_model, pr_trianglelist);
} else {
    block_model=vertex_create_buffer();
    vertex_begin(block_model, World.vertex_format_default);
}

for (var i=0; i<n; i+=3){
    for (var j=0; j<3; j++){
        xx[j]=buffer_read(argument0, T);
        yy[j]=buffer_read(argument0, T);
        zz[j]=buffer_read(argument0, T);
        
        nx[j]=buffer_read(argument0, T);
        ny[j]=buffer_read(argument0, T);
        nz[j]=buffer_read(argument0, T);
        buffer_read(argument0, T);
        buffer_read(argument0, T);
        col[j]=buffer_read(argument0, T);
        alpha[j]=buffer_read(argument0, T);
    }
    
    c_shape_add_triangle(xx[0], yy[0], zz[0], xx[1], yy[1], zz[1], xx[2], yy[2], zz[2]);
    
    if (argument1==ModelFormats.d3d_model){
        d3d_model_vertex_normal_colour(block_model, xx[0], yy[0], zz[0], nx[0], ny[0], nz[0], col[0], alpha[0]);
        d3d_model_vertex_normal_colour(block_model, xx[1], yy[1], zz[1], nx[1], ny[1], nz[1], col[1], alpha[1]);
        d3d_model_vertex_normal_colour(block_model, xx[2], yy[2], zz[2], nx[2], ny[2], nz[2], col[2], alpha[2]);
    } else {
        for (var j=0; j<3; j++){
            vertex_position_3d(block_model, xx[j], yy[j], zz[j]);
            vertex_normal(block_model, nx[j], ny[j], nz[j]);
            vertex_texcoord(block_model, 0, 0);
            vertex_colour(block_model, col[j], alpha[j]);
        }
    }
}

c_shape_end_trimesh(model);

if (argument1==ModelFormats.d3d_model){
    d3d_model_primitive_end(block_model);
} else {
    vertex_end(block_model);
    vertex_freeze(block_model);
}

return model;

#define const_model_get
/// mesh const_model_get(name, [container]);

if (argument_count==2){
    var container=argument[1];
} else {
    var container=World.active_vra_container;
}

if (!ds_map_exists(container.hash, argument[0])){
    show_message(argument[0]+" wasn't found in the archive.");
    print(argument[0]+" wasn't found in the archive.");
}

return container.hash[? argument[0]];

#define const_block_get
/// mesh const_block_get(name, [container]);

if (argument_count==2){
    var container=argument[1];
} else {
    var container=World.active_vra_container;
}

return container.block_hash[? argument[0]];