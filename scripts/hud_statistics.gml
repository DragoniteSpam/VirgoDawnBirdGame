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
            draw_text(W/2, H*2/3, "Statistics");
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
        var mx=W/2;
        var separation=8;
        var number_pages=3;
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(Font32);
        draw_rectangle_texture_auto(xx-16, yy, xx+W/2+16, yy+H/2, true);
        draw_set_color(c_black);
        draw_text(mx, yy+32, "Useless Statistics");
        draw_set_font(Font16);
        draw_text(mx, yy+H/2-32, "Page "+string(page+1)+"/"+string(number_pages));
//        draw_set_valign(fa_top);
        var list_titles=ds_list_create();
        var list_text=ds_list_create();
        switch (page){
            case 0:
                draw_text(mx, yy+64, "General");
                
                ds_list_add(list_titles, "Distance Walked:");
                ds_list_add(list_text, string(Player.stat_distance_walked/1000)+" km");
                
                ds_list_add(list_titles, "Times Jumped:");
                ds_list_add(list_text, string(Player.stat_jumps));
                
                ds_list_add(list_titles, "Potions Consumed:");
                ds_list_add(list_text, string(Player.stat_potions_consumed));
                
                ds_list_add(list_titles, "Arrows Shot:");
                ds_list_add(list_text, string(Player.stat_arrows));
                
                ds_list_add(list_titles, "Times Paused:");
                ds_list_add(list_text, string(Player.stat_menu_open));
                
                break;
            case 1:
                draw_text(mx, yy+64, "Magic");
                
                ds_list_add(list_titles, "Spells Cast:");
                ds_list_add(list_text, string(Player.stat_spells));
                
                for (var i=0; i<array_length_1d(Player.stat_spell_types); i++){
                    ds_list_add(list_titles, magic_names[i]+" Cast:");
                    ds_list_add(list_text, string(Player.stat_spell_types[i]));
                }
                
                break;
            case 2:
                draw_text(mx, yy+64, "Death");
                
                var deaths=ds_list_size(Player.stat_death_locations);
                
                ds_list_add(list_titles, "Times Died:");
                ds_list_add(list_text, string(deaths));
                
                ds_list_add(list_titles, "Last Death:");
                if (deaths>0){
                    ds_list_add(list_text, string(lm.locations[| deaths-1].name));
                } else {
                    ds_list_add(list_text, "N/A");
                }
                
                for (var i=0; i<array_length_1d(Player.stat_death_methods); i++){
                    ds_list_add(list_titles, all_death_type_names[i]+":");
                    ds_list_add(list_text, string(Player.stat_death_methods[i]));
                }

                break;
        }
        
        draw_set_halign(fa_right);
        for (var i=0; i<ds_list_size(list_titles); i++){
            draw_text(mx-separation, yy+96+16*i, list_titles[| i]);
        }
        draw_set_halign(fa_left);
        for (var i=0; i<ds_list_size(list_titles); i++){
            draw_text(mx+separation, yy+96+16*i, list_text[| i]);
        }

        ds_list_destroy(list_titles);
        ds_list_destroy(list_text);

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        draw_input(Controller.gp_bind_r, Controller.mk_bind_r, W-120, H-256, "Next Page");
        draw_input(Controller.gp_bind_l, Controller.mk_bind_l, W-120, H-160, "Previous Page");
        draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");
        
        if (Controller.release_l){
            page=(--page+number_pages)%number_pages;
        }
        if (Controller.release_r){
            page=(++page)%number_pages;
        }
        break;
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
