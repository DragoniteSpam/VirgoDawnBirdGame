draw_set_font(Font16);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
switch (pause_position){
    case Pause.main:
        game_hud_pause_main();
        break;
    case Pause.inventory:
        game_hud_pause_inventory();
        break;
    case Pause.team:
        break;
    case Pause.settings:
        game_hud_pause_settings();
        break;
    case Pause.gameplay:
        game_hud_pause_gameplay();
        break;
    case Pause.controls:
        game_hud_pause_controls();
        break;
    case Pause.graphics:
        game_hud_pause_graphics();
        break;
    case Pause.audio:
        game_hud_pause_audio();
        break;
    case Pause.back:
        break;
    case Pause.quit:
        game_hud_pause_quit();
        break;
    case Pause.cooking:
        game_hud_pause_cooking();
        break;
    case Pause.map:
        game_hud_pause_map();
        break;
}

if (Controller.press_start){
    Controller.press_start=false;
    unpause_game();
}
