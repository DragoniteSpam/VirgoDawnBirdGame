var h=356;
draw_rectangle_texture_auto(32, 32, W/2, h, true);
draw_rectangle_texture_auto(W/2+32, 32, W-32, H/2-32, true);
draw_set_color(graphics_text_color);

draw_set_halign(fa_center);
draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, get_text(Text.settReset));
draw_set_halign(fa_left);

draw_text(80, 64, get_text(Text.settFullscreen));
draw_text(80, 84, get_text(Text.settFOV));
draw_text(80, 104, get_text(Text.settRenderDistance));
draw_text(80, 124, get_text(Text.settAtmosphere));
draw_text(80, 144, get_text(Text.settCrosshair));
draw_text(80, 164, get_text(Text.settBackgroundColor));
draw_text(80, 184, get_text(Text.settPrintColor));
draw_text(80, 204, get_text(Text.settTextColor));
draw_text(80, 224, get_text(Text.settRenderDistanceLights));

draw_text(80, 284, get_text(Text.settGraphicsDefaults));
draw_text(80, 304, get_text(Text.settBackToSettings));

draw_set_halign(fa_right);

draw_text(W/2-32, 64, tf[window_get_fullscreen()]);
draw_text(W/2-32, 84, fov);
draw_text(W/2-32, 104, render_distance);
draw_text(W/2-32, 124, tf[render_atmosphere]);
var b=crosshair_array[crosshair_index];
var s=background_get_width(b);
draw_background(b, W/2-32-s, 144-s/2);
draw_text(W/2-32, 164, string(colour_get_red(graphics_white_color))+', '+string(colour_get_green(graphics_white_color))+', '+string(colour_get_blue(graphics_white_color)));
draw_text(W/2-32, 184, string(colour_get_red(graphics_final_color))+', '+string(colour_get_green(graphics_final_color))+', '+string(colour_get_blue(graphics_final_color)));
draw_text(W/2-32, 204, string(colour_get_red(graphics_text_color))+', '+string(colour_get_green(graphics_text_color))+', '+string(colour_get_blue(graphics_text_color)));
draw_text(W/2-32, 224, render_distance_lights);

draw_rectangle(72, 54+20*pause_major_n, W/2-8, 76+20*pause_major_n, true);

if (graphics_show_color_picker>-1){
    draw_rectangle_texture_auto(W/2+32, H/2, W-32, H-32, true);
    draw_set_halign(fa_center);
    draw_text(W/2+488, H/2+40, get_text(Text.settColorPicker));
    draw_text_ext(W/2+488, H/2+160, get_text(Text.settColorPickerDescription), -1, 200);
    var c1=make_color_rgb(graphics_red, 0, 0);
    var c2=make_color_rgb(graphics_red, 255, 0);
    var c3=make_color_rgb(graphics_red, 255, 255);
    var c4=make_color_rgb(graphics_red, 0, 255);
    draw_rectangle_colour(W/2+64, H/2+32, W/2+320, H/2+288, c1, c2, c3, c4, false);
    draw_rectangle_colour(W/2+336, H/2+32, W/2+368, H/2+288, c_red, c_red, c_black, c_black, false);
    draw_rectangle(W/2+64, H/2+32, W/2+320, H/2+288, true);
    draw_rectangle(W/2+336, H/2+32, W/2+368, H/2+288, true);
    draw_line_width_colour(W/2+336, H/2+288-graphics_red, W/2+368, H/2+288-graphics_red, 2, c_white, c_white);
    var go_back=false;
    if (get_release_b()){
        graphics_show_color_picker=-1;
    }
    if (mouse_within_rectangle(W/2+64, H/2+32, W/2+320, H/2+288)){
        draw_circle(MOUSE_X, MOUSE_Y, 4, true);
        if (Controller.a){
            var gg=MOUSE_X-(W/2+64);
            var bb=MOUSE_Y-(H/2+32);
            switch (graphics_show_color_picker){
                case 5:
                    graphics_white_color=make_colour_rgb(graphics_red, gg, bb);
                    break;
                case 6:
                    graphics_final_color=make_colour_rgb(graphics_red, gg, bb);
                    break;
                case 7:
                    graphics_text_color=make_colour_rgb(graphics_red, gg, bb);
                    break;
            }
        }
    } else if (mouse_within_rectangle(W/2+336, H/2+32, W/2+368, H/2+288)){
        draw_circle(MOUSE_X, MOUSE_Y, 4, true);
        if (Controller.a){
            graphics_red=clamp(H/2+288-MOUSE_Y, 0, 255)
        }
    } else {
        draw_cursor_auto();
    }
} else {
    pause_major_n=pause_cursor_handle(32, 32, W/2, h, pause_major_n, 12);
    var go_back=get_release_b();
    draw_cursor_auto();
}

display_cursor=false;

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
        draw_text(xx, 64, get_text(Text.settFullscreen));
        var fs=window_get_fullscreen();
        if (fs){
            draw_text_ext(xx, 104, string_copy(get_text(Text.settFullscreenOn), 1, pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy(get_text(Text.settFullscreenOff), 1, pause_t), -1, W/2-160);
        }
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            pause_t=0;
            window_set_fullscreen(!fs);
        }
        if (Controller.press_y){
            window_set_fullscreen(DEFAULT_FULLSCREEN);
            pause_t=0;
        }
        break;
    case 1:
        draw_text(xx, 64, get_text(Text.settFOV));
        var str=get_text(Text.settFOVDescription);
        draw_text_ext(xx, 104, string_copy(str, 1, pause_t), -1, W/2-160);
        if (Controller.a||Controller.right){
            fov=min(fov+1, 70);
        } else if (Controller.left){
            fov=max(fov-1, 20);
        }
        if (Controller.press_y){
            fov=DEFAULT_FOV;
        }
        break;
    case 2:
        draw_text(xx, 64, get_text(Text.settRenderDistance));
        if (render_distance<64){
            draw_text_ext(xx, 104, string_copy(get_text(Text.settRenderDistanceShort), 1, pause_t), -1, W/2-160);
        } else if (render_distance<160){
            draw_text_ext(xx, 104, string_copy(get_text(Text.settRenderDistanceDefault), 1, pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy(get_text(Text.settRenderDistanceFar), 1, pause_t), -1, W/2-160);
        }
        if (Controller.a||Controller.right){
            render_distance=min(render_distance+1, 255);
        } else if (Controller.left){
            render_distance=max(render_distance-1, 32);
        }
        if (Controller.press_y){
            render_distance=DEFAULT_RENDER_DISTANCE;
        }
        break;
    case 3:
        draw_text(xx, 64, get_text(Text.settAtmosphere));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settAtmosphereDescription), 1, pause_t), -1, W/2-160);
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            render_atmosphere=!render_atmosphere;
        }
        if (Controller.press_y){
            render_atmosphere=DEFAULT_RENDER_ATMOSPHERE;
        }
        break;
    case 4:
        draw_text(xx, 64, get_text(Text.settCrosshair));
        switch (crosshair_array[crosshair_index]){
            case b_cursor_none:
                draw_text_ext(xx, 104, string_copy(get_text(Text.settCrosshairNone), 1, pause_t), -1, W/2-160);
                break;
            case b_cursor:
                draw_text_ext(xx, 104, string_copy(get_text(Text.settCrosshairDefault), 1, pause_t), -1, W/2-160);
                break;
            case b_cursor_line:
                draw_text_ext(xx, 104, string_copy(get_text(Text.settCrosshairLine), 1, pause_t), -1, W/2-160);
                break;
            case b_cursor_circle:
                draw_text_ext(xx, 104, string_copy(get_text(Text.settCrosshairCircular), 1, pause_t), -1, W/2-160);
                break;
        }
        if (Controller.press_a||Controller.press_right){
            crosshair_index++;
            pause_t=0;
            if (crosshair_index==array_length_1d(crosshair_array)){
                crosshair_index=0;
            }
        } else if (Controller.press_left){
            crosshair_index--;
            pause_t=0;
            if (crosshair_index<0){
                crosshair_index=array_length_1d(crosshair_array)-1;
            }
        }
        if (Controller.press_y){
            crosshair_index=DEFAULT_CROSSHAIR_INDEX;
            pause_t=0;
        }
        break;
    case 5:
        draw_text(xx, 64, get_text(Text.settBackgroundColor));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settBackgroundColorDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            graphics_show_color_picker=pause_major_n;
        }
        if (Controller.press_y){
            graphics_white_color=DEFAULT_UI_WHITE;
            pause_t=0;
        }
        break;
    case 6:
        draw_text(xx, 64, get_text(Text.settPrintColor));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settPrintColorDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            graphics_show_color_picker=pause_major_n;
        }
        if (Controller.press_y){
            graphics_final_color=DEFAULT_UI_COLOR;
            pause_t=0;
        }
        break;
    case 7:
        draw_text(xx, 64, get_text(Text.settTextColor));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settTextColorDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            graphics_show_color_picker=pause_major_n;
        }
        if (Controller.press_y){
            graphics_text_color=c_black;
        }
        break;
    case 8:
        draw_text(xx, 64, get_text(Text.settRenderDistanceLights));
        if (render_distance_lights==0){
            draw_text_ext(xx, 104, string_copy(get_text(Text.settRenderDistanceLightsOffDescription), 1, pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy(get_text(Text.settRenderDistanceLightsDescription), 1, pause_t), -1, W/2-160);
        }
        if (Controller.a||Controller.right){
            render_distance_lights=min(render_distance_lights+1, BYTE-1);
        } else if (Controller.left){
            render_distance_lights=max(render_distance_lights-1, 0);
        }
        if (Controller.press_y){
            render_distance_lights=DEFAULT_RENDER_DISTANCE_LIGHTS;
        }
        break;
    case 9:
        draw_text(xx, 64, '(stub)');
        break;
    case 10:
        draw_text(xx, 64, '(stub)');
        break;
    case 11:
        draw_text(xx, 64, get_text(Text.settGraphicsDefaults));
        draw_text_ext(xx, 104, string_copy(get_text(Text.settGraphicsDefaultsDescription), 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            settings_reset_graphics();
            pause_t=0;
        }
        break;
    case 12:
        draw_text(xx, 64, get_text(Text.settBackToSettings));
        draw_text_ext(xx, 104, get_text(Text.settBackToSettingsDescription), -1, W/2-160);
        if (get_release_a()){
            go_back=true;
        }
        break;
}

pause_n2=pause_major_n;

// Section 5

if (go_back){
    pause_position=Pause.settings;
    pause_cursor_set(56, 64, 0);
    pause_major_n=0;
    play_tone_back();
}
