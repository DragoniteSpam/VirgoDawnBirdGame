/// void game_save_everything_global(map);

/**
 * Boolean flags
 */

var n=array_height_2d(boolean_flags);
ds_map_add(argument0, "__flags_size", n);

for (var i=0; i<n; i++){
    ds_map_add(argument0, "__flags_"+string(i), boolean_flags[i, 0]);
}

/**
 * Quests
 */

var n_active=ds_list_size(Player.active_quests);
ds_map_add(argument0, "__quest_active_size", n_active);

for (var i=0; i<n_active; i++){
    ds_map_add(argument0, "__quest_active_"+string(i)+"_id", Player.active_quests[| i].quest_id);
    ds_map_add(argument0, "__quest_active_"+string(i)+"_stage", Player.active_quests[| i].active_stage);
}

var n_completed=ds_list_size(Player.completed_quests);
ds_map_add(argument0, "__quest_completed_size", n_completed);

for (var i=0; i<n_completed; i++){
    ds_map_add(argument0, "__quest_completed_"+string(i)+"_id", Player.completed_quests[| i].quest_id);
}

/**
 * Other stuff
 */

ds_map_add(argument0, "__other_camera", Camera.pov);
