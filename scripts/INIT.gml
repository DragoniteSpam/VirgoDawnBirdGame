#define INIT
globalvar CURRENT_UNIX_TIME, game_current_second, game_current_minute;
globalvar game_current_hour, game_current_day, game_current_month, game_current_year;
game_current_second=current_second;
game_current_minute=current_minute;
game_current_hour=current_hour;
game_current_day=current_day;
game_current_month=current_month;
game_current_year=current_year;
day_era=Daytimes.night;
day_brightness=0;
CURRENT_UNIX_TIME=timeCurrentUnix();
last_second=current_second;

ini_open("Game.ini");
language=ini_read_real("Settings", "language", Languages.ENGLISH);
ini_close();

globalvar TXT;
TXT=ds_map_create();

cc_Text();

initial_random=random(720);

globalvar ALL_SELECTABLE, ALL_NPC;
ALL_SELECTABLE=ds_list_create();
ALL_NPC=ds_list_create();
list_lights=ds_list_create();
list_point_lights=ds_list_create();

time_io=0;
time_step=0;
time_draw=0;
time_draw_gui=0;
t_time_io=0;
t_time_step=0;
t_time_draw=0;
t_time_draw_gui=0;
f_real_fps=0;

time_draw_atmosphere=0;
time_draw_entity=0;
time_draw_npc=0;
time_draw_other=0;
t_time_draw_atmosphere=0;
t_time_draw_entity=0;
t_time_draw_npc=0;
t_time_draw_other=0;

// this is the frame the game finishes loading on, not the
// precise timestamp
time_load_finish=0;

show_debug_overlay(true);

globalvar invert_y, invert_x, sensitivity, auto_run, global_particle_density;
globalvar fov, render_distance, render_atmosphere, text_speed, difficulty;
globalvar measurements, time_scale, show_floaty_markers, crosshair_index;
globalvar render_distance_lights;

globalvar W, H, OFFSET, Font12, Font16, Font20, Font32;
W=room_width;
H=room_height;
OFFSET=320;

invert_y=DEFAULT_INVERT_Y;
invert_x=DEFAULT_INVERT_X;
sensitivity=DEFAULT_SENSITIVITY;
auto_run=DEFAULT_AUTO_RUN;
measurements=DEFAULT_MEASUREMENT_READING;
time_scale=DEFAULT_TIME_SCALE;
fov=DEFAULT_FOV;
render_distance=DEFAULT_RENDER_DISTANCE;
render_atmosphere=DEFAULT_RENDER_ATMOSPHERE;
crosshair_index=DEFAULT_CROSSHAIR_INDEX;
global_particle_density=DEFAULT_RENDER_DISTANCE;
show_floaty_markers=DEFAULT_FLOATY_MARKERS;
render_distance_lights=DEFAULT_RENDER_DISTANCE_LIGHTS;
difficulty=DEFAULT_DIFFICULTY;

text_speed=DEFAULT_TEXT_SPEED;
difficulty=DEFAULT_DIFFICULTY;

// UI color
globalvar graphics_final_color, graphics_text_color, graphics_white_color;
graphics_final_color=DEFAULT_UI_COLOR;
graphics_text_color=DEFAULT_UI_TEXT;
graphics_white_color=DEFAULT_UI_WHITE;

graphics_show_color_picker=-1;
graphics_red=128;

var characters="";
for (var i=33; i<256; i++){
    characters=characters+chr(i);
}

Font12=font_cn_12;
Font16=font_cn_16;
Font20=font_cn_20;
Font32=font_cn_32;

// General things
cursor_is_free=false;
mouse_dx=0;
mouse_xy=0;
mouse_xz=0;
display_cursor=true;
world_h_flip=false;
world_v_flip=false;

crosshair_array[0]=b_cursor_none;
crosshair_array[1]=b_cursor;
crosshair_array[2]=b_cursor_line;
crosshair_array[3]=b_cursor_circle;

// Audio

volume_effect=DEFAULT_VOLUME;
volume_music=DEFAULT_VOLUME;
volume_system=DEFAULT_VOLUME;
volume_global=DEFAULT_VOLUME_MAX;
volume_environmental=DEFAULT_VOLUME;

globalvar tex_default, mouse_x_last, mouse_y_last, MOUSE_X, MOUSE_Y, WW, HH;
WW=window_get_width();
HH=window_get_height();
MOUSE_X=(window_mouse_get_x()/WW)*W;
MOUSE_Y=(window_mouse_get_y()/HH)*H;
mouse_x_last=MOUSE_X;
mouse_y_last=MOUSE_Y;
tex_default=background_get_texture(b_tex_default);

globalvar mouse_over_menu;
mouse_over_menu=false;

// misc
location_flag=LocationFlags.water;
display_name_script=display_name_blank;
land_script=land_water;
model=Models.none;
model_index=0;
on_hit=null;

// mod stuff
mod_internal_name=BASE_ASSET;

ini_open('Game.ini');
var n=ini_read_real('Mods', 'quantity', 0);

globalvar all_mod_packages, all_mod_packages_array;
all_mod_packages=ds_map_create();
// making this a list would make my life easier but there's one place in code that
// asks for an array for generics purposes so there goes that
all_mod_packages_array=array_add(n+1, noone);

add_mod_package(BASE_ASSET, '.\data\birdgame.main.virgo');

var found=0;

for (var i=0; i<n; i++){
    var name=ini_read_string('Mods', string(i), '');
    if (file_exists(MOD_DIRECTORY+'\'+name)){
        add_mod_package(name, MOD_DIRECTORY+'\'+name);
        found++;
    }
}

ini_close();

if (found!=n){
    show_message(get_text(Text.warningModNotFound, n, found));
}

// constants (most of these don't actually need to be initialized but some
// of them have arrays associated with them too so ehh)
cc_Ach();
cc_CameraAngles();
cc_Combat();
cc_Daytimes();
cc_Directions();
cc_Emote();
cc_Entity();
cc_Flags();
cc_LocationIcons();
cc_Misc();
cc_Difficulty();
cc_Pause();
cc_TextSpeed();
cc_Time();
cc_Teleport();

var f=file_text_open_read('.\data\misc.virgo');
data_map=ds_map_create();
ds_map_read(data_map, file_text_read_string(f));
ds_grid_read(teleport_spots, data_map[? "teleport"]);

ds_map_destroy(data_map);
file_text_close(f);

globalvar tf, rg;

tf[false]="False";
tf[true]="True";
rg[false]=c_red;
rg[true]=c_green;

// Helper objects
instantiate(Controller);
instantiate(Camera);
instantiate(Compiler);

// dills
c_init();
CollisionWorldCreate();

// Editor
// yes, World gets a data script and a flag
globalvar mode;

data_script=data_script_world;
flag=FLAG_NO;
ini_open(".\EditorSettings.ini");
debug=true;
mode=GameModes.play;

editor_lighting=ini_read_real("blah", "editor_lighting", true);

edit_menu_mod_package=BASE_ASSET;
edit_menu_start=0;
edit_menu_start_template=0;
selected=noone;
edit_distance=ini_read_real("blah", "edit_distance", 256);
edit_is_moving=false;
edit_is_expanding=false;
edit_object_base=true;
edit_snap=ini_read_real("blah", "edit_snap", 0);
edit_object_last_added=noone;
//edit_event_last_added=Cutscenes.no;

edit_object_clipboard_model=Models.none;
edit_object_clipboard_xrot=0;
edit_object_clipboard_yrot=0;
edit_object_clipboard_zrot=0;
edit_object_clipboard_name="";
//edit_object_clipboard_cutscene=Cutscenes.no;
edit_object_clipboard_text="";

edit_map_location_scroll_index=0;
edit_map_location_scroll_max=38;
edit_map_active_location=noone;

edit_quest_index=Quests.no;
edit_quest_scroll_index=0;

edit_inventory_index=Items.NONE;
edit_inventory_scroll_index=0;
edit_item_scroll_index=0;
edit_inventory_mod_package=BASE_ASSET;

edit_text_scroll_index=0;

edit_all_index=0;

edit_generation_index=Models.gen_tree_00;
edit_generation_package=BASE_ASSET;
edit_generation_quantity=ini_read_real("blah", "edit_generation_quantity", 0.001);
edit_generation_point=Misc.edit_generation_off;
edit_generation_x1=0;
edit_generation_y1=0;
edit_generation_x2=0;
edit_generation_y2=0;
edit_generation_map=ds_map_create();
edit_generation_randomize_xrot=false;
edit_generation_randomize_yrot=false;
edit_generation_randomize_zrot=false;
edit_geneartion_z_min=false;
edit_geneartion_z_max=false;

edit_cutscene_index=0;
edit_cutscene_active=noone;
edit_cutscene_limit=40;
edit_cutscene_line_index=0;
edit_cutscene_line_active=0;
edit_cutscene_line_pos=0;
edit_cutscene_line_char=1;
edit_cutscene_line_char_limit=100;
edit_cutscene_box_start=0;

edit_database_mode=ini_read_real("blah", "edit_database_mode", Database.items);
edit_database_show_mods=false;
edit_database_package=BASE_ASSET;
edit_database_temp=BASE_ASSET;
edit_database_start=0;
edit_database_limit=39;
edit_database_active=0;
edit_database_overlay=Misc.edit_db_overlay_none;
edit_database_overlay_item_icon_start=0;

edit_database_filter="";
edit_database_filter_list=ds_list_create();
edit_database_filter_start=0;

edit_database_model_color_red=0;
edit_database_model_path_start=0;
edit_database_model_visible_index=0;

edit_database_ag_songs_start=0;
edit_database_ag_song_index=0;

edit_file_page=Misc.edit_file_page_default;
edit_file_mod_list_start=0;
edit_file_mod_list_limit=39;

ini_close();

active_vra_container=noone;
all_vra_containers=ds_list_create();
// i'd just use the second one but there's a place in code that really needs an ordered list
all_vra_containers_map=ds_map_create();

xx=0;
yy=0;
zz=0;
ray_object=noone;

map_index=0;

// database editor
database_page=undefined;
database_index=0;
database_control=noone;

// title screen
title_index=0;
title_stage=Misc.title_main;

// pause menu
pause_show=false;
pause_is_hidden=false;  // in case you want to hide the Pause menu without resuming play, for using Key Items or something, maybe
pause_position=0;
pause_main_n=0;
pause_t=0;
pause_n2=0;
pause_flavor_text="";

pause_major_n=0;
pause_minor_n=0;
pause_major_state=Pause.none;
pause_minor_reserve=0;
pause_item_reserve=0;
pause_move_reserve="";
pause_inventory_show_chuck_quantity=1;
pause_inventory_chuck_n=0;
pause_inventory_equip_n=0;

// Cooking

cooking_position=0;
cooking_list_index=0;
cooking_list_offset=0;
cooking_show_list=false;
cooking_package[1]=BASE_ASSET;
cooking_package[0]=BASE_ASSET;
cooking_input[1]=0;
cooking_input[0]=0;

// Map

map_nav_location=noone;
map_nav_position=Misc.map_navigate;
map_confirm_position=0;
map_zoom=1;
map_central_x=0.5;
map_central_y=0.5;

// scripting
cutscene=noone;
cutscene_index=0;
scene_index=0;
speaking=noone;
cutscene_jump_map=ds_map_create();
speaking_arrow=false;
cutscene_mod_package=BASE_ASSET;
for (var i=9; i>=0; i--){
    vars[i]=0;
}

entities=ds_map_create();
entities[? "World"]=World.id;
entities[? "Camera"]=Camera.id;
entities[? "me"]=instantiate(EntityMethodHolder).id;
// Can't do this anymore because the compiler checks to see if the
// instance being referenced actively exists. Oh well.
//instance_deactivate_object(EntityMethodHolder);
variables=ds_map_create();
INIT_VARIABLES();
keep_going=false;


// Player is inserted into the map on Player.Create()

fade_target=0;
fade_rate=0;
fade_alpha=0;
fade_color=c_white;
horizontal_bar_separation=H/2;

// const_whatever DID go here

tex_snow=background_get_texture(b_tex_snow);
tex_moon=background_get_texture(b_tex_moon);

tex_default=background_get_texture(b_tex_default);
tex_atmosphere=background_get_texture(b_tex_atmosphere);

placeholder_red=background_get_texture(b_tex_red);
placeholder_yellow=background_get_texture(b_yellow);

/// Graphics

show_hud=true;

shd_alpha_alpha=shader_get_uniform(shd_alpha, "alpha");
shd_brightness=shader_get_uniform(shd_bright_contrast, "brightness_amount");
shd_contrast=shader_get_uniform(shd_bright_contrast, "contrast_amount");

shd_alpha_brightness_alpha=shader_get_uniform(shd_alpha_brightness, "alpha");
shd_alpha_brightness_brightness=shader_get_uniform(shd_alpha_brightness, "brightness");

water_uni_time = shader_get_uniform(shd_wave,"time");
wter_time = 0;

alpha_stars=0;

globalvar draw_mode;
draw_mode=Misc.model;

if (debug){
    window_set_size(W+OFFSET, max(720, H));
}

// Vertex formats?
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_basic=vertex_format_end();

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_textcoord();
vertex_format_add_colour();
vertex_format_default=vertex_format_end();

alarm[ALARM_RESIZE]=1;
surface_resize(application_surface, W, H);

debug_panel=Misc.debug_main;
alive=true;

timer_wait=-1;

// Random stats
us_comets=0;
us_cell_swap_time=0;
us_cell_swap_times=0;

#define INIT_LOAD
/// boolean INIT_LOAD();
// Loads resources into the game.
// Returns true when finished, false otherwise.

// database
// do these first because others may depend on their existence

const_model();

const_particles();
        
// okay now you can load everything else
// comments above each script indicate whether users should have mod power over them

// maybe
const_class();

// no
const_combat_ai();

// incomplete (try to support new sound effects?)
const_audio();

// maybe (although these will likely be replaced by the Bestiary at some point)
const_cards();

// maybe
const_legilimens();

// maybe
const_environment();

// maybe
const_bestiary();

// yes
const_item_effect();

// if people want it, it shouldn't be hard to add
const_item_pocket();

// no
const_item_weapon_data();

// done
const_item();

// yes
const_cooking_recipes();

// yes
const_pressure_plate_actions();

// yes
const_quest();

// done
const_npc();

// no
const_death();

// no
const_shader();

// maybe
const_weather();

// put the Map and Cutscene ones last because it may depend on other things (probably models)

// yes
const_map();

// no
const_cutscene();

// maybe
const_model_templates();

/*
 * Other mod things:
 *   - Cutscenes!
 *   - Books
 *   - NPC textures
 *   - Base texture (should be attached to Map)
 *   - Boolean flags
 */

// load mods

for (var i=0; i<array_length_1d(all_mod_packages_array); i++){
    var buffer=buffer_load(all_mod_packages_array[i].path);
    database_read(all_mod_packages_array[i], buffer);
    buffer_delete(buffer);
}

// This stuff has to go down here 'cause it reads from some of the other arrays
active_shader=all_shaders[Shaders.none];
stored_shader=Shaders.none;
SetShader(Shaders.none);

(add_entity(Models.extra_player, 0, GAME_TITLE_X, GAME_TITLE_Y, GAME_TITLE_Z, Player, true)).name="Player";

Player.direction=GAME_TITLE_DIRECTION;
Player.pitch=-3.5;
register(Player.id, BASE_ASSET, NPCs.ActivePlayer);
Player.locked=true;

d3d_start();
d3d_set_culling(true);
d3d_set_hidden(true);
d3d_set_shading(true);
d3d_light_enable(Misc.sun, true);
d3d_light_enable(Misc.camera, true);
draw_set_alpha_test(true);
d3d_set_zwriteenable(true);

mode=GameModes.title;
time_load_finish=frames;
instance_deactivate_object(Struct);
instance_deactivate_object(ModPackage);

game_map_enter(BASE_ASSET, Maps.temperence);

#define INIT_PREPARE
x=room_width/2;
y=room_height/2;

frames=0;
delta_time_seconds=0;
status_id=READY_NOT;
randomize();
// Random quotes, for various silly purposes
var f=file_text_open_read(".\lang\quotes.txt");
var n=file_text_read_real(f);
file_text_readln(f);
quotes=array_add(n, "");
for (var i=0; i<n; i++){
    quotes[i]=file_text_read_string(f);
    file_text_readln(f);
}
file_text_close(f);

var f=file_text_open_read(".\lang\nato.txt");
nato_names=array_add(26, "");
for (var i=0; i<26; i++){
    nato_names[i]=file_text_read_string(f);
    file_text_readln(f);
}
file_text_close(f);

rq=quotes[irandom(array_length_1d(quotes)-1)];
rq_show=false;
rq_color=c_white;

random_nato_name=nato_names[irandom(array_length_1d(nato_names)-1)];

application_surface_draw_enable(false);

methods=methods_world(ds_map_create());

if (!directory_exists(SAVE_FILE_DIRECTORY)){
    directory_create(SAVE_FILE_DIRECTORY);
}
if (!directory_exists(MOD_DIRECTORY)){
    directory_create(MOD_DIRECTORY);
}
if (!directory_exists(CACHE_DIRECTORY)){
    directory_create(CACHE_DIRECTORY);
}

INIT();

// player movement debugging

dbg_movement_state=MovementStates.still;
dbg_xspeed=0;
dbg_yspeed=0;
dbg_zspeed=0;
dbg_below=0;

#define INIT_VARIABLES
variables[? "c_white"]=c_white;
variables[? "c_black"]=c_black;
variables[? "c_blue"]=c_blue;
variables[? "c_red"]=c_red;
variables[? "c_green"]=c_green;
variables[? "c_lime"]=c_lime;
variables[? "c_aqua"]=c_aqua;
variables[? "c_dkgray"]=c_dkgray;
variables[? "c_fuchsia"]=c_fuchsia;
variables[? "c_gray"]=c_gray;
variables[? "c_ltgray"]=c_ltgray;
variables[? "c_maroon"]=c_maroon;
variables[? "c_olive"]=c_olive;
variables[? "c_orange"]=c_orange;
variables[? "c_orange"]=c_orange;
variables[? "c_silver"]=c_silver;
variables[? "c_teal"]=c_teal;
variables[? "c_yellow"]=c_yellow;
variables[? "c_brown"]=c_brown;
variables[? "c_pink"]=c_pink;
variables[? "c_brown"]=c_brown;