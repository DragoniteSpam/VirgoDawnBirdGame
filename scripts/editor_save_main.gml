// Relevant: https://xkcd.com/2021/

var buffer=buffer_create(power(2, 10), buffer_grow, 1);

var package=all_mod_packages[? World.mod_internal_name];

/*
 * Required VRAs, audio files, etc
 */

var names=ds_list_create();

for (var i=0; i<array_length_1d(package.my_models); i++){
    var model=package.my_models[i];
    var model_archive=get_vra_container_from_name(model.archive, noone);
    if (model_archive!=noone&&!model_archive.base_archive&&(ds_list_find_index(names, model.archive)==-1)){
        ds_list_add(names, model.archive);
    }
}

for (var i=0; i<array_length_1d(package.my_bgm); i++){
    var bgm=package.my_bgm[i];
    if (!bgm.internal_song){
        if (ds_list_find_index(names, bgm.path)==-1){
            ds_list_add(names, bgm.path);
        }
    }
}

// this is converted to a string because I'm too lazy to figure out the endianness
// and what have you of the buffer in the launcher program
buffer_write(buffer, buffer_string, string(ds_list_size(names)));

for (var i=0; i<ds_list_size(names); i++){
    buffer_write(buffer, buffer_string, names[| i]);
}

ds_list_destroy(names);

/*
 * Metadata
 */

var metadata_map=ds_map_create();
ds_map_add(metadata_map, "name", World.mod_internal_name);
// THIS IS VERY IMPORTANT. IF YOU ADD MORE DATA TYPES YOU NEED TO KEEP THIS UP-TO-DATE.
ds_map_add(metadata_map, "quantity", 9);

buffer_write(buffer, buffer_string, ds_map_write(metadata_map));
ds_map_destroy(metadata_map);

/*
 * Background Music (has to come before audio groups)
 */

var bgm_map=ds_map_create();

ds_map_add(bgm_map, "type", Database.bgm);

editor_save_main_generic(package.my_bgm, bgm_map, package.required_bgm, editor_save_main_bgm, editor_save_main_generic_bgm, get_bgm_from_name);

buffer_write(buffer, buffer_string, ds_map_write(bgm_map));
ds_map_destroy(bgm_map);

/*
 * Audio Groups
 */

var ag_map=ds_map_create();

ds_map_add(ag_map, "type", Database.audio_groups);

editor_save_main_generic(package.my_audio_groups, ag_map, package.required_audio_groups, editor_save_main_audio_groups, editor_save_main_generic_audio_groups, get_audio_group_from_name);

buffer_write(buffer, buffer_string, ds_map_write(ag_map));
ds_map_destroy(ag_map);

/*
 * Models
 */

var model_map=ds_map_create();

ds_map_add(model_map, "type", Database.models);

editor_save_main_generic(package.my_models, model_map, package.required_models, editor_save_main_models, editor_save_main_generic_models, get_model_from_name);

buffer_write(buffer, buffer_string, ds_map_write(model_map));
ds_map_destroy(model_map);

/*
 * Items
 */

var item_map=ds_map_create();

ds_map_add(item_map, "type", Database.items);

editor_save_main_generic(package.my_items, item_map, package.required_items, editor_save_main_items, editor_save_main_generic_items, get_item_from_name);

buffer_write(buffer, buffer_string, ds_map_write(item_map));
ds_map_destroy(item_map);

/*
 * NPCs
 */

var npc_map=ds_map_create();

ds_map_add(npc_map, "type", Database.npcs);

editor_save_main_generic(package.my_npcs, npc_map, package.required_npcs, editor_save_main_npcs, editor_save_main_generic_npcs, get_npc_from_name);

buffer_write(buffer, buffer_string, ds_map_write(npc_map));
ds_map_destroy(npc_map);

/*
 * Cooking recipes
 */

var recipe_map=ds_map_create();

ds_map_add(recipe_map, "type", Database.recipes);

editor_save_main_generic(package.my_recipes, recipe_map, package.required_recipes, editor_save_main_recipes, editor_save_main_generic_recipes, get_cooking_recipe_from_name);

buffer_write(buffer, buffer_string, ds_map_write(recipe_map));
ds_map_destroy(recipe_map);

/*
 * Item Effects
 */

var ie_map=ds_map_create();

ds_map_add(ie_map, "type", Database.item_effects);

editor_save_main_generic(package.my_item_effects, ie_map, package.required_item_effects, editor_save_main_item_effects, editor_save_main_generic_item_effects, get_item_effect_from_name);

buffer_write(buffer, buffer_string, ds_map_write(ie_map));
ds_map_destroy(ie_map);

/*
 * Maps
 */

var map_map=ds_map_create();    // lol

ds_map_add(map_map, "type", Database.maps);

editor_save_main_generic(package.my_maps, map_map, package.required_maps, editor_save_main_maps, editor_save_main_generic_maps, get_map_from_name);

buffer_write(buffer, buffer_string, ds_map_write(map_map));
ds_map_destroy(map_map);

/*
 * Pressure Plate Actions
 */

var ppa_map=ds_map_create();

ds_map_add(ppa_map, "type", Database.pressure_plate_actions);

editor_save_main_generic(package.my_pressure_plate_actions, ppa_map, package.required_pressure_plate_actions, editor_save_main_pressure_plate_actions, editor_save_main_generic_pressure_plate_actions, get_pressure_plate_action_from_name);

buffer_write(buffer, buffer_string, ds_map_write(ppa_map));
ds_map_destroy(ppa_map);

/*
 * Close it off
 */

buffer_save_ext(buffer, argument0, 0, buffer_tell(buffer));
buffer_delete(buffer);
