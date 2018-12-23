var h=204;
var alpha=1;
draw_rectangle_texture_auto(32, 32, W/2, h, true);
draw_rectangle_texture_auto(W/2+32, 32, W-32, H/2-32, true);
draw_set_color(graphics_text_color);

draw_set_halign(fa_center);
draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, "Reset");
draw_set_halign(fa_left);

draw_text(80, 64, "Effects:");
draw_text(80, 84, "System:");
draw_text(80, 104, "Environment:");
draw_text(80, 124, "Music:");
draw_text(80, 144, "Master:");
draw_text(80, 164, "Audio: Restore Defaults");
draw_text(80, 184, "Back");

draw_set_halign(fa_right);

draw_roundrect_ext(W/2-128, 60, W/2-128+volume_effect/9*96, 68, 2, 2, false);
draw_roundrect_ext(W/2-128, 80, W/2-128+volume_system/9*96, 88, 2, 2, false);
draw_roundrect_ext(W/2-128, 100, W/2-128+volume_environmental/9*96, 108, 2, 2, false);
draw_roundrect_ext(W/2-128, 120, W/2-128+volume_music/9*96, 128, 2, 2, false);
draw_roundrect_ext(W/2-128, 140, W/2-128+volume_global/9*96, 148, 2, 2, false);
draw_roundrect_ext(W/2-128, 60, W/2-32, 68, 2, 2, true);
draw_roundrect_ext(W/2-128, 80, W/2-32, 88, 2, 2, true);
draw_roundrect_ext(W/2-128, 100, W/2-32, 108, 2, 2, true);
draw_roundrect_ext(W/2-128, 120, W/2-32, 128, 2, 2, true);
draw_roundrect_ext(W/2-128, 140, W/2-32, 148, 2, 2, true);

draw_set_halign(fa_right);

draw_rectangle(72, 54+20*pause_major_n, W/2-8, 76+20*pause_major_n, true);

pause_major_n=pause_cursor_handle(32, 32, W/2, h, pause_major_n, 6);

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
        draw_text(xx, 64, "Volume: Effects");
        pause_flavor_text="The volume of sound effects used in battle, etc.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (Controller.press_right){
            pause_t=pause_flavor_text_length();
            volume_effect=(++volume_effect)%DEFAULT_VOLUME_MAX;
        } else if (Controller.press_left){
            pause_t=pause_flavor_text_length();
            volume_effect=(--volume_effect+DEFAULT_VOLUME_MAX)%DEFAULT_VOLUME_MAX;
        }
        if (mouse_within_rectangle(W/2-128, 56, W/2-32, 72)){
            if (Controller.a){
                volume_effect=clamp((MOUSE_X-(W/2-128))*9/96, 0, DEFAULT_VOLUME_MAX-1);
            }
            alpha=0.4;
        }
        if (Controller.press_y){
            volume_effect=DEFAULT_VOLUME;
            pause_t=0;
        }
        break;
    case 1:
        draw_text(xx, 64, "Volume: System");
        pause_flavor_text="The volume of system effects such as the Action button or Pause menu tone.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (Controller.press_right){
            pause_t=pause_flavor_text_length();
            volume_system=(++volume_system)%DEFAULT_VOLUME_MAX;
        } else if (Controller.press_left){
            pause_t=pause_flavor_text_length();
            volume_system=(--volume_system+DEFAULT_VOLUME_MAX)%DEFAULT_VOLUME_MAX;
        }
        if (mouse_within_rectangle(W/2-128, 76, W/2-32, 92)){
            if (Controller.a){
                volume_system=clamp((MOUSE_X-(W/2-128))*9/96, 0, DEFAULT_VOLUME_MAX-1);
            }
            alpha=0.4;
        }
        if (Controller.press_y){
            volume_system=DEFAULT_VOLUME;
            pause_t=0;
        }
        break;
    case 2:
        draw_text(xx, 64, "Volume: Environmental");
        pause_flavor_text="The volume of noises from natural sources, such as water or fire.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (Controller.press_right){
            pause_t=pause_flavor_text_length();
            volume_environmental=(++volume_environmental)%DEFAULT_VOLUME_MAX;
        } else if (Controller.press_left){
            pause_t=pause_flavor_text_length();
            volume_environmental=(--volume_environmental+DEFAULT_VOLUME_MAX)%DEFAULT_VOLUME_MAX;
        }
        if (mouse_within_rectangle(W/2-128, 96, W/2-32, 112)){
            if (Controller.a){
                volume_environmental=clamp((MOUSE_X-(W/2-128))*9/96, 0, DEFAULT_VOLUME_MAX-1);
            }
            alpha=0.4;
        }
        if (Controller.press_y){
            volume_environmental=DEFAULT_VOLUME;
            pause_t=0;
        }
        break;
    case 3:
        draw_text(xx, 64, "Volume: Music");
        pause_flavor_text="The volume of the game's background music.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (Controller.press_right){
            pause_t=pause_flavor_text_length();
            volume_music=(++volume_music)%DEFAULT_VOLUME_MAX;
        } else if (Controller.press_left){
            pause_t=pause_flavor_text_length();
            volume_music=(--volume_music+DEFAULT_VOLUME_MAX)%DEFAULT_VOLUME_MAX;
        }
        if (mouse_within_rectangle(W/2-128, 116, W/2-32, 132)){
            if (Controller.a){
                volume_music=clamp((MOUSE_X-(W/2-128))*9/96, 0, DEFAULT_VOLUME_MAX-1);
            }
            alpha=0.4;
        }
        if (Controller.press_y){
            volume_music=DEFAULT_VOLUME;
            pause_t=0;
        }
        break;
    case 4:
        draw_text(xx, 64, "Volume: Master");
        pause_flavor_text="The volume of everything in the game.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (Controller.press_right){
            pause_t=pause_flavor_text_length();
            volume_global=(++volume_global)%DEFAULT_VOLUME_MAX;
        } else if (Controller.press_left){
            pause_t=pause_flavor_text_length();
            volume_global=(--volume_global+DEFAULT_VOLUME_MAX)%DEFAULT_VOLUME_MAX;
        }
        if (mouse_within_rectangle(W/2-128, 136, W/2-32, 152)){
            if (Controller.a){
                volume_global=clamp((MOUSE_X-(W/2-128))*9/96, 0, DEFAULT_VOLUME_MAX-1);
            }
            alpha=0.4;
        }
        if (Controller.press_y){
            volume_global=DEFAULT_VOLUME;
            pause_t=0;
        }
        break;
    case 5:
        draw_text(xx, 64, "Restore Defaults");
        pause_flavor_text="Reset the default settings.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (get_release_a()){
            settings_reset_audio();
            pause_t=0;
        }
        break;
    case 6:
        draw_text(xx, 64, "Back to Settings Menu");
        pause_flavor_text="Go back to change some of the other settings, or return to the game.";
        draw_text_ext(xx, 104, pause_get_flavor_text(), -1, W/2-160);
        if (Controller.press_a){
            go_back=true;
        }
        break;
}

draw_set_alpha(alpha);
draw_cursor_auto();
draw_set_alpha(1);

display_cursor=false;

settings_reset_audio_levels();

pause_n2=pause_major_n;

if (go_back){
    pause_position=Pause.settings;
    pause_cursor_set(56, 64, 0);
    play_tone_back();
    audio_set_master_gain(0, AUDIO_VOLUME_REDUCED);
}
