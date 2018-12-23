/// void scr_quest_begin(ArgSet);
/* start a quest
 * Arguments:
 *   - Quest questID: the ID of the quest to begin
 */

var q=all_quests[argument0[| 0].value];
ds_list_add(Player.active_quests, q);
AddNotification(get_text(Text.questStartedQuest)+': '+q.name);

var has_active_quest=false;
for (var i=0; i<ds_list_size(Player.active_quests); i++){
    if (Player.active_quests[| i].active){
        has_active_quest=true;
        break;
    }
}

q.active=!has_active_quest;

World.keep_going=true;
