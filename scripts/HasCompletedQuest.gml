/// void HasCompletedQuest(Quest index);

var quest=all_quests[argument0];
if (ds_list_find_index(Player.completed_quests, quest)!=-1){
    return true;
} else {
    return false;
}
