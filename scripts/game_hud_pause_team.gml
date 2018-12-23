/// void game_hud_pause_inventory();

var s=ds_list_size(Player.team);
var go_back=get_release_b();
draw_rectangle_texture_auto(32, 32, W/4, 104+20*s, true);

draw_set_color(graphics_text_color);
draw_text(80, 64, get_text(Text.menuTeam));
if (s==1){
    draw_text(80, 84, get_text(Text.menuTeamEmpty));
} else {
    for (var i=1; i<ds_list_size(Player.team); i++){
        var teammate=all_classes[Player.team[| i]];
        var image=teammate.image;
        var width=background_get_width(image);
        var height=background_get_height(image);
        draw_background_part(image, background_get_width(image)/3, 0, width/3, height/3, 74, 58+20*i);
        draw_text(100, 64+20*i, teammate.name);
    }
}
draw_text(80, 84+20*s, get_text(Text.invBack));

pause_major_n=pause_cursor_handle(32, 52, W/4, 104+20*s, pause_major_n, s);
draw_rectangle(72, 74+20*pause_major_n, W/4-8, 96+20*pause_major_n, true);

if (get_release_a()){
    if (pause_major_n==s){
        go_back=true;
    } else {
        if (s>1){
            set_class(Player.team[| pause_major_n+1]);
            unpause_game();
        }
    }
}

if (go_back){
    pause_position=Pause.main;
    play_tone_back();
    pause_cursor_set(56, 64, 0);
}
