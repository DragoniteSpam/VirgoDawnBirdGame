var h=304;
draw_rectangle_texture_auto(32, 32, W/2, h, true);
draw_rectangle_texture_auto(W/2+32, 32, W-32, H/2-32, true);
draw_set_color(graphics_text_color);

draw_set_halign(fa_center);
draw_input(Controller.gp_bind_y, Controller.mk_bind_y, W-120, H-64, "Reset");
draw_set_halign(fa_left);

draw_text(80, 64, "Invert X:");
draw_text(80, 84, "Invert Y:");
draw_text(80, 104, "Look sensitivity:");
draw_text(80, 124, "Auto-run:");
draw_text(80, 144, "Text speed:");
draw_text(80, 164, "Measurements:");
draw_text(80, 184, "Time Scale:");
draw_text(80, 204, "Show Floaty Markers");
draw_text(80, 224, get_text(Text.settDifficulty));
draw_text(80, 244, "Handedness:");
draw_text(80, 264, "Restore Defaults");
draw_text(80, 284, "Back");

draw_set_halign(fa_right);
draw_text(W/2-32, 64, tf[invert_x]);
draw_text(W/2-32, 84, tf[invert_y]);
draw_text(W/2-32, 104, sensitivity);
draw_text(W/2-32, 124, tf[auto_run]);
draw_text(W/2-32, 144, text_speed_names[text_speed]);
if (measurements==Misc.imperial){
    draw_text(W/2-32, 164, "Imperial");
} else {
    draw_text(W/2-32, 164, "Metric");
}
draw_text(W/2-32, 184, time_scale);
draw_text(W/2-32, 204, tf[show_floaty_markers]);
draw_text(W/2-32, 224, all_difficulties[difficulty]);
draw_text(W/2-32, 244, ternary(Player.handedness==Misc.right, "Right", "Left"));

draw_rectangle(72, 54+20*pause_major_n, W/2-8, 76+20*pause_major_n, true);

draw_cursor_auto();

display_cursor=false;

pause_major_n=pause_cursor_handle(32, 32, W/2, h, pause_major_n, 11);

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
        draw_text(xx, 64, "Gameplay: Invert X");
        var str="You look the ";
        if (invert_x){
            str=str+"opposite";
        } else {
            str=str+"same";
        }
        str=str+" direction when you move the mouse or the right stick on the controller left and right.";
        draw_text_ext(xx, 104, string_copy(str, 1, pause_t), -1, W/2-160);
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            invert_x=!invert_x;
            pause_t=0;
        }
        if (Controller.press_y){
            invert_x=DEFAULT_INVERT_X;
            pause_t=0;
        }
        break;
    case 1:
        draw_text(xx, 64, "Gameplay: Invert Y");
        var str="You look the ";
        if (invert_y){
            str=str+"opposite";
        } else {
            str=str+"same";
        }
        str=str+" direction when you move the mouse or the right stick on the controller up and down.";
        draw_text_ext(xx, 104, string_copy(str, 1, pause_t), -1, W/2-160);
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            invert_y=!invert_y;
            pause_t=0;
        }
        if (Controller.press_y){
            invert_y=DEFAULT_INVERT_Y;
            pause_t=0;
        }
        break;
    case 2:
        draw_text(xx, 64, "Gameplay: Look Sensitivity");
        var str="How sensitive the game is to mouse or right analog stick input."
        if (sensitivity<64){
            str=str+"##(That is INSANELY low, you know.)";
        }
        draw_text_ext(xx, 104, string_copy(str, 1, pause_t), -1, W/2-160);
        if (Controller.a||Controller.right){
            sensitivity=min(sensitivity+1, 255);
        } else if (Controller.left){
            sensitivity=max(sensitivity-1, 1);
        }
        if (Controller.press_y){
            sensitivity=DEFAULT_SENSITIVITY;
        }
        break;
    case 3:
        draw_text(xx, 64, "Gameplay: Auto Run");
        if (auto_run){
            draw_text_ext(xx, 104, string_copy("Gotta go fast.", 1, 2*pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy("Moving around quickly is nice, but there are some times when you'd prefer to just take it slowly.", 1, pause_t/2), -1, W/2-160);
        }
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            auto_run=!auto_run;
            pause_t=0;
        }
        if (Controller.press_y){
            auto_run=DEFAULT_AUTO_RUN;
            pause_t=0;
        }
        break;
    case 4:
        draw_text(xx, 64, "Gameplay: Text Speed");
        switch (text_speed){
            case TextSpeeds.fast:
                draw_text_ext(xx, 104, string_copy("The game text scrolls decently quickly.", 1, pause_t), -1, W/2-160);
                break;
            case TextSpeeds.faster:
                draw_text_ext(xx, 104, string_copy("The game text moves along at quite a fast pace.", 1, pause_t), -1, W/2-160);
                break;
            case TextSpeeds.fastest:
                draw_text_ext(xx, 104, string_copy("The game text appears nearly instantly.", 1, pause_t), -1, W/2-160);
                break;
            case TextSpeeds.lightning:
                draw_text_ext(xx, 104, string_copy("This setting is supposed to be unavailable to the user and I have no idea how you ended up here.", 1, pause_t), -1, W/2-160);
                break;
        }
        // You're not supposed to be able to access "N speed,"
        // so the last element in the array is blocked off.
        
        if (Controller.press_a||Controller.press_right){
            text_speed++;
            pause_t=0;
            if (text_speed==array_length_1d(text_speed_values)-1){    // it's -1 because it skips "n speed"
                text_speed=0;
            }
        } else if (Controller.press_left){
            text_speed--;
            pause_t=0;
            if (text_speed<0){
                text_speed=array_length_1d(text_speed_values)-2;
            }
        }
        if (Controller.press_y){
            text_speed=DEFAULT_TEXT_SPEED;
            pause_t=0;
        }
        break;
    case 5:
        draw_text(xx, 64, "Gameplay: Measurement Readings");
        if (measurements==Misc.imperial){
            draw_text_ext(xx, 104, string_copy("You prefer your measurements to be represented in weird units like feet and pounds.", 1, pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy("You prefer your measurments to be in nice, easy, sane units like meters and kilograms.", 1, pause_t), -1, W/2-160);
        }
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            pause_t=0;
            if (measurements==Misc.imperial){
                measurements=Misc.metric;
            } else {
                measurements=Misc.imperial;
            }
        }
        if (Controller.press_y){
            measurements=DEFAULT_MEASUREMENT_READING;
            pause_t=0;
        }
        break;
    case 6:
        // time_scale is how many in-game seconds pass per second of real time
        draw_text(xx, 64, "Gameplay: In-Game Clock Speed");
        draw_text_ext(xx, 104, "The rate at which time passes.", -1, W/2-160);
        if (time_scale==1){
            var str="Time passes in real time.##A single day/night cycle takes 24 hours to complete. Coincidentally, this is the same rate at which it passes in real life!";
        } else if (time_scale==30){
            var str="One minute passes in-game every two seconds of real time.##A single day/night cycle takes 48 minutes to complete.";
        } else if (time_scale==60){
            var str="One minute passes in-game every second of real time.##A single day/night cycle takes 24 minutes to complete.";
        } else {
            if (time_scale>240){
                var a="##God damn.";
            } else if (time_scale>120){
                var a="##That's . . . pretty fast.";
            } else {
                var a="";
            }
            var str="A second of real time is "+string(time_scale)+" seconds in-game.##A single day/night cycle takes ";
            if (time_scale==24){
                str=str+"one hour";
            } else if (time_scale>24){
                var m=floor(1440/time_scale);
                var s=floor(86400/time_scale)%60;
                var mm=string(m)+" minute";
                if (m>1){
                    mm=mm+"s";
                }
                if (s>0){
                    var ss=", "+string(s)+" second";
                    if (s>1){
                        ss=ss+"s";
                    }
                } else {
                    var ss="";
                }
                str=str+mm+ss;
            } else {
                var h=floor(24/time_scale);
                var m=floor(1440/time_scale)%60;
                var hh=string(h)+" hour";
                if (h>1){
                    hh=hh+"s";
                }
                if (m>0){
                    var mm=", "+string(m)+" minute";
                    if (m>1){
                        mm=mm+"s";
                    }
                } else {
                    var mm="";
                }
                str=str+hh+mm;
            }
            str=str+" to complete."+a;
        }
        draw_text_ext(xx, 124, string_copy(str, 1, pause_t), -1, W/2-160);
        if (Controller.press_a||Controller.press_right){
            pause_t=string_length("The rate at which time passes in the game.");
            time_scale=(time_scale%1440)+1;
        } else if (Controller.press_left){
            pause_t=string_length("The rate at which time passes in the game.");
            time_scale=((time_scale+1438)%1440)+1;
        }
        if (Controller.press_y){
            time_scale=DEFAULT_TIME_SCALE;
            pause_t=0;
        }
        break;
    case 7:
        draw_text(xx, 64, "Gameplay: Show Floaty Markers");
        if (show_floaty_markers){
            draw_text_ext(xx, 104, string_copy("Show the floaty markers over the quest objective.", 1, 2*pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy("You're a REAL adventurer. (Or you just have a real good memory.)", 1, pause_t/2), -1, W/2-160);
        }
        if (Controller.press_a||Controller.press_left||Controller.press_right){
            show_floaty_markers=!show_floaty_markers;
            pause_t=0;
        }
        if (Controller.press_y){
            show_floaty_markers=DEFAULT_FLOATY_MARKERS;
            pause_t=0;
        }
        break;
    case 8:
        switch (difficulty){
            case DifficultyModes.noob:
                draw_text(xx, 64, "Gameplay: Difficulty: Noob");
                draw_text_ext(xx, 104, string_copy("Perhaps you want to enjoy the plot without worrying about getting slammed by the foes.", 1, 2*pause_t), -1, W/2-160);
                break;
            case DifficultyModes.easy:
                draw_text(xx, 64, "Gameplay: Difficulty: Easy");
                draw_text_ext(xx, 104, string_copy("Not too bad, I hope.", 1, 2*pause_t), -1, W/2-160);
                break;
            case DifficultyModes.regular:
                draw_text(xx, 64, "Gameplay: Difficulty: Regular");
                draw_text_ext(xx, 104, string_copy("Play the game as it was intended to be played.", 1, 2*pause_t), -1, W/2-160);
                break;
            case DifficultyModes.hard:
                draw_text(xx, 64, "Gameplay: Difficulty: Hard");
                draw_text_ext(xx, 104, string_copy("If you're up for a challenge.", 1, 2*pause_t), -1, W/2-160);
                break;
            case DifficultyModes.masochist:
                draw_text(xx, 64, "Gameplay: Difficulty: Masochist");
                draw_text_ext(xx, 104, string_copy("I guess some people like Dark Souls.", 1, 2*pause_t), -1, W/2-160);
                break;
        }
        var n=array_length_1d(all_difficulties);
        if (Controller.press_a||Controller.press_right){
            difficulty=(++difficulty)%n;
            pause_t=0;
        }
        if (Controller.press_left){
            difficulty=(--difficulty+n)%n;
            pause_t=0;
        }
        if (Controller.press_y){
            difficulty=DEFAULT_DIFFICULTY;
            pause_t=0;
        }
        break;
    case 9:
        draw_text(xx, 64, "Gameplay: Player Handedness");
        if (Player.handedness==Misc.right){
            draw_text_ext(xx, 104, string_copy("The player is right-handed.", 1, pause_t), -1, W/2-160);
        } else {
            draw_text_ext(xx, 104, string_copy("The player is left-handed. (If you haven't already you may want to switch the mouse button controls around.)", 1, pause_t), -1, W/2-160);
        }
        if (get_release_a()||Controller.press_left||Controller.press_right){
            Player.handedness=ternary(Player.handedness==Misc.right, Misc.left, Misc.right);
            pause_t=0;
        }
        if (Controller.press_y){
            Player.handedness=DEFAULT_HANDEDNESS;
            pause_t=0;
        }
        break;
    case 10:
        draw_text(xx, 64, "Gameplay: Restore Defaults");
        draw_text_ext(xx, 104, string_copy("Change the gameplay settings to the state they were in when you started the game for the first time.", 1, pause_t), -1, W/2-160);
        if (get_release_a()){
            settings_reset_gameplay();
            pause_t=0;
        }
        break;
    case 11:
        draw_text(xx, 64, "Back to Settings Menu");
        draw_text_ext(xx, 104, "Change some of the other settings in the game.", -1, W/2-160);
        if (get_release_a()){
            go_back=true;
        }
        break;
}

pause_n2=pause_major_n;

if (go_back){
    pause_position=Pause.settings;
    pause_cursor_set(56, 64, 0);
    pause_major_n=0;
    play_tone_back();
}
