with (World){
    var cm=game_current_month-1;
    cm=cm+argument0;
    if (cm>=12){
        game_current_year=game_current_year+(cm div 12);
        cm=cm%12;
    }
    game_current_month=cm+1;
}
