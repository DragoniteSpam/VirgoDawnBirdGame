/// void GetQuestStage(Quest index);

var quest=all_quests[argument0];

if (ds_list_find_index(Player.active_quests, quest)==-1){
    return 0;
} else {
    return quest.stages[| quest.active_stage].stage_id;
}
