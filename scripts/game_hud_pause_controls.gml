var h=708;
draw_rectangle_texture_auto(32, 32, W/2, h, true);
draw_rectangle_texture_auto(W/2+32, 32, W-32, H/2-32, true);
draw_set_color(graphics_text_color);

draw_set_halign(fa_center);
draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, "Reset");
draw_set_halign(fa_left);

draw_text(80, 64, "Controls");
draw_text(80, 96, "Action (primary)");
draw_text(80, 128, "Action (secondary)");
draw_text(80, 160, "B");
draw_text(80, 192, "X");
draw_text(80, 224, "Y");
draw_text(80, 256, "Start");
draw_text(80, 288, "Select");
draw_text(80, 320, "L");
draw_text(80, 352, "R");
draw_text(80, 384, "L2");
draw_text(80, 416, "R2");
draw_text(80, 448, "Left Stick");
draw_text(80, 480, "Right Stick");
draw_text(80, 512, "D-Pad Up");
draw_text(80, 544, "D-Pad Down");
draw_text(80, 576, "D-Pad Left");
draw_text(80, 608, "D-Pad Right");
draw_text(80, 640, "Restore Defaults");
draw_text(80, 672, "Back");

with (Controller){
    var xx=360;
    draw_text(xx-16, 64, "Gamepad");
    draw_control_button(gp_bind_a, xx, 96);
    draw_control_button(gp_bind_b, xx, 160);
    draw_control_button(gp_bind_x, xx, 192);
    draw_control_button(gp_bind_y, xx, 224);
    draw_control_button(gp_bind_start, xx, 256);
    draw_control_button(gp_bind_select, xx, 288);
    draw_control_button(gp_bind_l, xx, 320);
    draw_control_button(gp_bind_r, xx, 352);
    draw_control_button(gp_bind_l2, xx, 384);
    draw_control_button(gp_bind_r2, xx, 416);
    draw_control_button(gp_bind_ls, xx, 448);
    draw_control_button(gp_bind_rs, xx, 480);
    draw_control_button(gp_bind_padu, xx, 512);
    draw_control_button(gp_bind_padd, xx, 544);
    draw_control_button(gp_bind_padl, xx, 576);
    draw_control_button(gp_bind_padr, xx, 608);
    
    xx=440;

    draw_text(xx, 64, "Mouse and Keyboard");
    draw_control_key(mk_bind_a_a, xx, 96);
    draw_control_key(mk_bind_a_b, xx, 128);
    draw_control_key(mk_bind_b, xx, 160);
    draw_control_key(mk_bind_x, xx, 192);
    draw_control_key(mk_bind_y, xx, 224);
    draw_control_key(mk_bind_start, xx, 256);
    draw_control_key(mk_bind_select, xx, 288);
    draw_control_key(mk_bind_l, xx, 320);
    draw_control_key(mk_bind_r, xx, 352);
    draw_control_key(mk_bind_l2, xx, 384);
    draw_control_key(mk_bind_r2, xx, 416);
    draw_control_key(mk_bind_ls, xx, 448);
    draw_control_key(mk_bind_rs, xx, 480);
    draw_control_key(mk_bind_padu, xx, 512);
    draw_control_key(mk_bind_padd, xx, 544);
    draw_control_key(mk_bind_padl, xx, 576);
    draw_control_key(mk_bind_padr, xx, 608);
}

draw_rectangle(72, 48+32*pause_major_n, W/2-8, 82+32*pause_major_n, true);

draw_cursor_auto();

display_cursor=false;

pause_major_n=pause_cursor_handle(32, 32, W/2, h, pause_major_n, 19, 56, 64, 32);

// Go back doesn't equal get_release_b here because that might be input
// intended to rebind some control.
var go_back=false;
var xx=W/2+80;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (pause_n2!=pause_major_n){
    pause_t=0;
} else {
    pause_update_flavor_text();
}

var ccon=gamepad_is_connected(0);

switch (pause_major_n){
    case 0:
        draw_text(xx, 64, "Controls");
        draw_text_ext(xx, 104, "To remap a button, scroll to it in the menu and hit the mouse or gamepad button, or keyboard key, that you want to bind to it. You're free to bind the same buttons to multiple inputs, though it's probably a bad idea.##Note that Up, Down, Left and Right (WASD or the left control stick) can't be changed. Sorry, southpaws.", -1, W/2-160);
        break;
    case 1:
        draw_text(xx, 64, "Controls: Action (primary)");
        draw_text_ext(xx, 104, "This is often used for things like talking to people, selecting stuff in menus, etc.##Warning: binding a letter to the Action button may cause text input to be sent prematurely.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_a_a=current_key;
            unset_a();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_a=current_button;
            unset_a();
        }
        break;
    case 2:
        draw_text(xx, 64, "Controls: Action (secondary)");
        draw_text_ext(xx, 104, "This is often used for things like talking to people, selecting stuff in menus, etc.##Warning: binding a letter to the Action button may cause text input to be sent prematurely.##(Yes, there are two Action button options, since it's probably the most-used one in the game.)", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_a_b=current_key;
            unset_a();
        }
        break;
    case 3:
        draw_text(xx, 64, "Controls: B");
        draw_text_ext(xx, 104, "Commonly used for backing out of menus or cancelling commands.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_b=current_key;
            unset_b();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_b=current_button;
            unset_b();
        }
        break;
    case 4:
        draw_text(xx, 64, "Controls: X");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_x=current_key;
            unset_x();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_x=current_button;
            unset_x();
        }
        break;
    case 5:
        draw_text(xx, 64, "Controls: Y");
        draw_text_ext(xx, 104, "Mainly used for jumping, not that there's really much reason to jump in this game. Also occasionally things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_y=current_key;
            unset_y();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_y=current_button;
            unset_y();
        }
        break;
    case 6:
        draw_text(xx, 64, "Controls: Start");
        draw_text_ext(xx, 104, "Pause and unpause the game.##Warning: binding a letter to the Start button may cause some undesirable effects when inputting text.##Honestly, you probably don't want to mess with this one anyway.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_start=current_key;
            unset_start();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_start=current_button;
            unset_start();
        }
        break;
    case 7:
        draw_text(xx, 64, "Controls: Select");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus, as well as acting as the Backspace key for text input.##Warning: binding a letter to the Select button may cause some undesirable effects when inputting text.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_select=current_key;
            unset_select();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_select=current_button;
            unset_select();
        }
        break;
    case 8:
        draw_text(xx, 64, "Controls: L");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_l=current_key;
            unset_l();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_l=current_button;
            unset_l();
        }
        break;
    case 9:
        draw_text(xx, 64, "Controls: R");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_r=current_key;
            unset_r();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_r=current_button;
            unset_r();
        }
        break;
    case 10:
        draw_text(xx, 64, "Controls: L2");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_l2=current_key;
            unset_l2();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_l2=current_button;
            unset_l2();
        }
        break;
    case 11:
        draw_text(xx, 64, "Controls: R2");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_r2=current_key;
            unset_r2();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_r2=current_button;
            unset_r2();
        }
        break;
    case 12:
        draw_text(xx, 64, "Controls: Left Stick");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_ls=current_key;
            unset_ls();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_ls=current_button;
            unset_ls();
        }
        break;
    case 13:
        draw_text(xx, 64, "Controls: Right Stick");
        draw_text_ext(xx, 104, "A general-purpose button (as of my writing this). Occasionally used for things in menus.", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_rs=current_key;
            unset_rs();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_rs=current_button;
            unset_rs();
        }
        break;
    case 14:
        draw_text(xx, 64, "Controls: D-Pad Up");
        draw_text_ext(xx, 104, "", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_padu=current_key;
            unset_padu();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_padu=current_button;
            unset_padu();
        }
        break;
    case 15:
        draw_text(xx, 64, "Controls: D-Pad Down");
        draw_text_ext(xx, 104, "", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_padd=current_key;
            unset_padd();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_padd=current_button;
            unset_padd();
        }
        break;
    case 16:
        draw_text(xx, 64, "Controls: D-Pad Left");
        draw_text_ext(xx, 104, "", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_padl=current_key;
            unset_padl();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_padl=current_button;
            unset_padl();
        }
        break;
    case 17:
        draw_text(xx, 64, "Controls: D-Pad Right");
        draw_text_ext(xx, 104, "", -1, W/2-160);
        var current_key=get_current_key();
        if (current_key!=vk_nokey){
            Controller.mk_bind_padr=current_key;
            unset_padr();
        }
        var current_button=get_current_button();
        if (current_button!=vk_nokey){
            Controller.gp_bind_padr=current_button;
            unset_padr();
        }
        break;
    case 18:
        draw_text(xx, 64, "Controls: Restore Defaults");
        draw_text_ext(xx, 104, string_copy("Change the control settings to the state they were in when you started the game for the first time.", 1, pause_t), -1, W/2-160);
        // this has to be checked directly
        if (keyboard_check(Controller.mk_bind_a_a)||keyboard_check(Controller.mk_bind_a_b)||gamepad_button_check(0, Controller.gp_bind_a)){
            settings_reset_controls();
            pause_t=0;
        } else if (get_release_b()){
            go_back=true;
        }
        break;
    case 19:
        draw_text(xx, 64, "Back to Settings Menu");
        draw_text_ext(xx, 104, "Change some of the other settings in the game.", -1, W/2-160);
        if (get_release_a()||get_release_b()){
            go_back=true;
        }
        break;
}

pause_n2=pause_major_n;

if (go_back){
    pause_position=Pause.settings;
    pause_major_n=0;
    pause_cursor_set(56, 64, 0);
    play_tone_back();
}
