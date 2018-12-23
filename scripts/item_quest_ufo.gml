/// void item_quest_ufo(base item);

// if you're in the ring, it's night and the moon is in the sky and quest has been activated and is at Stage 100
if (scr_GetQuestUFO(null)){
    ValidateAllQuests(2100);
    var ufo=all_npcs[NPCs.NPCUFOUFO].actor;
    unpause_game();
    with (ufo){
        interact_character();
    }
} else {
    item_show_book_atob(argument0);
}
