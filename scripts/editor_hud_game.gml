// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var start_x=32;
var h=H-32;
draw_rectangle_colour(0, 0, W, H, c_white, c_white, c_white, c_white, false);
draw_rectangle_texture_auto(start_x, 32, W/4, 192, true);
draw_set_color(graphics_text_color);

draw_text(start_x+16, 48, "Game Values");
draw_text(start_x+16, 80, "Time");
draw_text(start_x+16, 96, "second: "+string(game_current_second));
draw_text(start_x+16, 112, "minute: "+string(game_current_minute));
draw_text(start_x+16, 128, "hour: "+string(game_current_hour));
draw_text(start_x+16, 144, "day: "+string(game_current_day));
draw_text(start_x+16, 160, "month: "+string(game_current_month));
draw_text(start_x+16, 176, "year: "+string(game_current_year));

if (mouse_within_rectangle(start_x, 88, W/4, 192)){
    mouse_over_menu=true;
    var hovering=(MOUSE_Y-88) div 16;
    draw_rectangle(start_x+8, 72+16*hovering, W/4-8, 88+16*hovering, true);
    switch (hovering){
        case 0:
            if (get_release_a()){
                game_current_second=clamp(get_integer("Game current second?", game_current_second), 0, 60);
            }
            break;
        case 1:
            if (get_release_a()){
                game_current_minute=clamp(get_integer("Game current minute?", game_current_minute), 0, 60);
            }
            break;
        case 2:
            if (get_release_a()){
                game_current_hour=clamp(get_integer("Game current hour?", game_current_hour), 0, 24);
            }
            break;
        case 3:
            if (get_release_a()){
                switch (game_current_month){
                    case Months.January:
                    case Months.March:
                    case Months.May:
                    case Months.July:
                    case Months.August:
                    case Months.October:
                    case Months.December:
                        var days=31;
                        break;
                    case Months.February:
                        if (game_current_year%4==0){
                            var days=29;
                        } else {
                            var days=28;
                        }
                        break;
                    default:
                        var days=30;
                        break;
                }
                game_current_day=clamp(get_integer("Game current day?", game_current_day), 1, days);
            }
            break;
        case 4:
            if (get_release_a()){
                game_current_month=clamp(get_integer("Game current month?", game_current_month), 1, 12);
            }
            break;
        case 5:
            if (get_release_a()){
                game_current_year=max(get_integer("Game current year?", game_current_year), 0);
            }
            break;
    }
}

start_x=W/4+32;
h=H-32;
draw_rectangle_texture_auto(start_x, 32, W/2, 192, true);

draw_text(start_x+16, 48, "Player Values");
var class=all_classes[Player.class];
draw_text(start_x+16, 80, "Class: "+class.name);
draw_text(start_x+16, 96, "HP Level: "+string(Player.exp_hp));
draw_text(start_x+16, 112, "MP Level: "+string(Player.exp_mp));
draw_text_colour(start_x+16, 128, "    HP: "+string(get_max_hp(Player.exp_hp)), c_gray, c_gray, c_gray, c_gray, 1);
draw_text_colour(start_x+16, 144, "    MP: "+string(get_max_mp(Player.exp_mp)), c_gray, c_gray, c_gray, c_gray, 1);
draw_text(start_x+16, 160, "Restore HP and MP");

if (mouse_within_rectangle(start_x, 72, W/2, 192)){
    mouse_over_menu=true;
    var hovering=(MOUSE_Y-88) div 16;
    draw_rectangle(start_x+8, 72+16*hovering, W/2-8, 88+16*hovering, true);
    switch (hovering){
        case 0:
            if (get_release_a()){
                Player.class=get_class_from_name(get_string("New class?", all_classes[Player.class].name), Player.class);
            }
            break;
        case 1:
            if (get_release_a()){
                Player.exp_hp=clamp(get_integer("Player heart containers?", Player.exp_hp), 0, BYTE);
            }
            break;
        case 2:
            if (get_release_a()){
                Player.exp_mp=clamp(get_integer("Player MP heart containers?", Player.exp_mp), 0, BYTE);
            }
            break;
        case 3:
            // calculated HP
            break;
        case 4:
            // calculated MP
            break;
        case 5:
            if (get_release_a()){
                Player.hp_current=get_max_hp(Player.exp_hp);
                Player.mp_current=get_max_mp(Player.exp_mp);
            }
            break;
    }
}
