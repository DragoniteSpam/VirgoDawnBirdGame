/// void game_load_everything_global(map);

/**
 * Boolean flags
 */

var n=argument0[? "__flags_size"];

for (var i=0; i<n; i++){
    boolean_flags[i, 0]=argument0[? "__flags_"+string(i)];
}

/**
 * Quests
 */

ds_list_clear(Player.active_quests);
ds_list_clear(Player.completed_quests);
for (var i=0; i<array_length_1d(all_quests); i++){
    all_quests[i].active_stage=0;
    all_quests[i].active=false;
}

var n_active=argument0[? "__quest_active_size"];

for (var i=0; i<n_active; i++){
    var quest_id=argument0[? "__quest_active_"+string(i)+"_id"];
    var q=all_quests[quest_id];
    ds_list_add(Player.active_quests, quest_id);
    q.active_stage=argument0[? "__quest_active_"+string(i)+"_stage"];
    q.active=true;
}

var n_completed=argument0[? "__quest_completed_size"];

for (var i=0; i<n_completed; i++){
    var quest_id=argument0[? "__quest_completed_"+string(i)+"_id"];
    ds_list_add(Player.completed_quests, quest_id);
}

/**
 * Other stuff
 */

Camera.pov=argument0[? "__other_camera"];
