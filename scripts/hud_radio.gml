mouse_over_menu=true;
display_cursor=false;

// Inputs

var go_back=get_release_b();
var next_station=Controller.release_right||Controller.release_pright;
var previous_station=Controller.release_left||Controller.release_pleft;

// The card
var xx=WW/2-background_get_width(b_summary)/2;
var yy=HH/2-background_get_height(b_summary)/2;

/*draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, W, H, false);
draw_set_alpha(1.0);
draw_set_color(c_black);*/
draw_clear_alpha(c_black, 0.5)
draw_set_font(Font32);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_background(b_summary, xx, yy);

var yyy=(yy+H/2)/2;

draw_set_font(Font20);
draw_text(W/2, yyy, "Station:");
draw_set_font(Font32);
draw_text(W/2, yyy+32, all_stations[| station].name);
draw_set_font(Font16);
var yyy=(H/2-yy)*1.5+yy;
// @todo
draw_text(W/2, yyy, "Song: "/*+all_audio_info[current_sound_index].name*/);
draw_text(W/2, yyy+20, "Author: "/*+all_audio_info[current_sound_index].author*/);

draw_input(Controller.gp_bind_padr, Controller.mk_bind_padr, W-120, H-256, "Next Station");
draw_input(Controller.gp_bind_padl, Controller.mk_bind_padl, W-120, H-160, "Previous Station");
draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");

var n=ds_list_size(all_stations);
if (next_station){
    station=(++station)%n;
    PLAY_AUTO();
} else if (previous_station){
    station=(--station+n)%n;
    PLAY_AUTO();
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
