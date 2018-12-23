/// void interact_character();

//ValidateAllQuests();

if (aggro_target==noone||!aggro_target.alive){
    with (Player){
        set_last_land();
    }
    
    movement_player_stop();
    scr_cutscene_launch(cutscene_index);
}
