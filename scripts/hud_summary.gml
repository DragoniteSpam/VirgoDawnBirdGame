mouse_over_menu=true;
display_cursor=false;

// Inputs

var go_back=get_release_b();
var flip=get_release_y();

// The card
var xx=WW/2-background_get_width(b_summary)/2;
var yy=HH/2-background_get_height(b_summary)/2;

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, W, H, false);
draw_set_alpha(1.0);
draw_set_color(c_black);
draw_set_font(Font32);
draw_set_halign(fa_left);

draw_background(b_summary, xx, yy);

draw_text(xx+48, yy+64, Player.name);

if (front){
    // Character customization and stuff
    draw_set_font(Font12);
    draw_text(xx+48, yy+96, "$"+string(GetPlayerMoney()));
    
    customization_index=pause_cursor_handle(xx+16, yy+120, xx+160, yy+240, customization_index, 6, xx+40, yy+160, 16);
    
    draw_rectangle(xx+48, yy+152+16*customization_index, xx+320, yy+168+16*customization_index, true);

    // Input prompts
    draw_set_halign(fa_center);
    
    draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-160, "Flip");
    draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");
    
    // Draw the character and control what it looks like
//    draw_character_frame(W/2+64, H/2-64, Player.gender, Player.cc_body, Player.cc_clothes, Player.cc_hat, Player.cc_hair, Player.cc_acc, 4, 4, Player.cc_color_hair, Player.cc_color_clothes, customization_frame, customization_direction);
    player_frame=(player_frame+ANIMATION_FRAME_STANDING)%3;
    if (Controller.press_r){
        switch (player_direction){
            case 0:
                player_direction=1;
                break;
            case 1:
                player_direction=3;
                break;
            case 2:
                player_direction=0;
                break;
            case 3:
                player_direction=2;
                break;
        }
    } else if (Controller.press_l){
        switch (player_direction){
            case 0:
                player_direction=2;
                break;
            case 1:
                player_direction=0;
                break;
            case 2:
                player_direction=3;
                break;
            case 3:
                player_direction=1;
                break;
        }
    }
} else {    // if back
}

if (flip){
    front=!front;
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
