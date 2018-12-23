/// QuestStage add_quest_stage(name, stage ID, floaty marker package, floaty marker, validation, description, [visible?]);

with (instantiate(QuestStage, argument[0])){
    stage_id=argument[1];
    floaty_marker_package=argument[2];
    floaty_marker=argument[3];
    validation=argument[4];
    description=argument[5];
    switch (argument_count){
        case 7:
            notify=argument[6];
            break;
    }
    return id;
}
