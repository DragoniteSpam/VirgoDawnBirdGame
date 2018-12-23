if (cutscene==noone&&argument0==Player.id){
    with (Player){
        stats_update_player_deaths(DeathTypes.death_drown);
        cutscene_index=get_cutscene_from_name("No Water Walking", 0);
        scr_cutscene_launch(cutscene_index);
    }
}
