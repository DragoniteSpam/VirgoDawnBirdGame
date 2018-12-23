/// void HasStartedQuest(Quest index);

var quest=all_quests[argument0];
if (ds_list_find_index(Player.active_quests, quest)!=-1){
    return true;
} else {
    return HasCompletedQuest(argument0);
}
