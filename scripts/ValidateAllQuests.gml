if (argument_count==0){
    var param=0;
} else {
    var param=argument[0];
}

for (var i=0; i<ds_list_size(Player.active_quests); i++){
    var q=Player.active_quests[| i];
    var stage=q.stages[| q.active_stage];
    // @todo Different Entity references instead of self.id ?
    if (script_execute(stage.validation, self.id, param)){
        q.active_stage++;
        // Completed the quest
        if (q.active_stage==ds_list_size(q.stages)){
            AddNotification(get_text(Text.questCompletedQuest)+': '+q.name);
            ds_list_delete(Player.active_quests, i);
            i--;
            ds_list_add(Player.completed_quests, q);
            q.active=false;
        } else {
            if (stage.notify){
                var stage_next=q.stages[| q.active_stage];
                AddNotification(get_text(Text.questCompletedObjective)+': '+stage.name);
                AddNotification(get_text(Text.questNextObjective)+': '+stage_next.name);
            }
        }
    }
}
