var h=216;
draw_rectangle_texture_auto(32, 32, W/2, h, true);
draw_rectangle_texture_auto(W/2+32, 32, W-32, H/2-32, true);
draw_set_color(graphics_text_color);

draw_text(80, 64, get_text(Text.settGameplay));
draw_text(80, 84, get_text(Text.settControl));
draw_text(80, 104, get_text(Text.settGraphics));
draw_text(80, 124, get_text(Text.settAudio));
draw_text(80, 144, get_text(Text.settDefaults));
draw_text(80, 164, get_text(Text.settReturn));

draw_rectangle(72, 54+20*pause_major_n, W/2-8, 76+20*pause_major_n, true);

draw_cursor_auto();

display_cursor=false;

pause_major_n=pause_cursor_handle(32, 32, W/2, h, pause_major_n, 5);

var go_back=get_release_b();
var xx=W/2+80;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (pause_n2!=pause_major_n){
    pause_t=0;
} else {
    pause_update_flavor_text();
}

switch (pause_major_n){
    case 0:
        draw_text(xx, 64, get_text(Text.settGameplay));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settGameplayDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            pause_position=Pause.gameplay;
            pause_major_n=0;
            pause_cursor_set(56, 64, 0);
        }
        break;
    case 1:
        draw_text(xx, 64, get_text(Text.settControl));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settControlDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            pause_position=Pause.controls;
            pause_major_n=0;
            pause_cursor_set(56, 64, 0);
        }
        break;
    case 2:
        draw_text(xx, 64, get_text(Text.settGraphics));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settGraphicsDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            pause_position=Pause.graphics;
            pause_major_n=0;
            pause_cursor_set(56, 64, 0);
        }
        break;
    case 3:
        draw_text(xx, 64, get_text(Text.settAudio));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settAudioDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            pause_position=Pause.audio;
            pause_major_n=0;
            pause_cursor_set(56, 64, 0);
            audio_set_master_gain(0, 1);
        }
        break;
    case 4:
        draw_text(xx, 64, get_text(Text.settDefaults));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settDefaultsDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            settings_reset_all();
            pause_t=0;
        }
        break;
    case 5:
        draw_text(xx, 64, get_text(Text.settReturn));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settReturnDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            go_back=true;
        }
        break;
}

pause_n2=pause_major_n;

if (go_back){
    pause_position=Pause.main;
    pause_cursor_set(56, 64, pause_main_n);
    play_tone_back();
}
