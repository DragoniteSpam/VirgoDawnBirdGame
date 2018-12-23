mouse_over_menu=true;
display_cursor=false;
var go_back=get_release_b();

switch (state){
    case Misc.pokedex_start:
        draw_set_alpha(min(t/25, 0.5));
        draw_rectangle_colour(0, 0, W, H, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
        var h=background_get_height(b_star);
        var w=background_get_width(b_star);
        if (t>60){
            draw_set_alpha((t-60)/60);
            draw_set_halign(fa_center);
            draw_set_font(Font32);
            draw_text(W/2, H*2/3, "Achievements");
            if (t>=240){
                state=Misc.pokedex_main;
            }
        }
        draw_background_ext(b_star, W/2-w*4, H/2-h*4, 8, 8, 0, c_yellow, t/60);
        draw_set_alpha(1);
        t++;
        break;
    case Misc.pokedex_main:
        var xx=W/4;
        var yy=H/4;
        
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_set_font(Font32);
        draw_rectangle_texture_auto(xx-16, yy, xx+W/2+16, yy+H/2, true);
        draw_set_color(c_black);
        draw_text(xx+32, yy+32, "Achievements");
        draw_text(xx+W/2-128, yy+32, string(get_achievement_total())+"/"+string(array_length_1d(achievement)));
        draw_set_valign(fa_top);
        draw_set_font(Font16);
        for (var i=start; i<start+17; i++){
            if (index==i){
                var c=c_blue;
            } else {
                var c=graphics_text_color;
            }
            draw_text_colour(xx+32, yy+64+16*(i-start), ach_names[i, 0], c, c, c, c, 1);
            draw_sprite(spr_checkbox_16, achievement[i], xx, yy+64+16*(i-start+1));
        }
        draw_line(W/2, yy+64, W/2, yy+H/2-16);
        draw_text_ext(W/2+112, yy+64, ach_names[index, 0], -1, 192);
        draw_line(W/2+32, yy+144, xx+W/2-32, yy+144);
        if (achievement[index]){
            draw_sprite_stretched(ic_achievements, index, W/2+32, yy+64, 64, 64);
            draw_text_ext(W/2+32, yy+160, ach_names[index, 1], -1, 256);
        } else {
            draw_rectangle(W/2+32, yy+64, W/2+96, yy+128, true);
            draw_text(W/2+32, yy+160, "???");
        }
        var len=array_length_1d(achievement);
        if (Controller.release_down){
            index=(index+1)%len;
        } else if (Controller.release_up){
            index=(index+len-1)%len;
        }
        start=clamp(index, index, min(index+17, len-17));
        break;
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
