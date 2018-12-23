// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var h=H-32;

//////////////////////////////////////////
// List of things that you can click on //
//////////////////////////////////////////

draw_rectangle_texture_auto(32, 32, W/4, h, true);
draw_set_color(graphics_text_color);
draw_text(48, 48, "Cutscenes");

// things
/*for (var i=edit_menu_start; i<min(array_length_1d(game_cutscene_names), edit_menu_start+EDIT_MENU_LIMIT); i++){
    draw_text(48, 80+16*(i-edit_menu_start), game_cutscene_names[i]);
}*/

if (mouse_within_rectangle(32, 56, W/4, h)){
    mouse_over_menu=true;
    // this technically should have a min(length of model array) with it, but the model array is always going to be way longer than that
    var hovering=clamp((MOUSE_Y-72) div 16, 0, EDIT_MENU_LIMIT-1);
//    var m=game_cutscene_names[hovering+edit_menu_start];
    
    draw_rectangle(40, 70+16*hovering, W/4-8, 90+16*hovering, true);
    if (get_release_a()){
        if (selected!=noone){
            selected.cutscene_index=hovering+edit_menu_start;
        }
    }
}

///////////////////////////////////
// Whatever the raycast lands on //
///////////////////////////////////

if (selected==noone){
    var obj=ray_object;
} else {
    var obj=selected;
}

if (obj!=noone){
    script_execute(obj.data_script, obj);
}

//////////////////////////
/////// Controls /////////
//////////////////////////

if (!Controller.start){
    zz=max(0, zz);
}

if (!mouse_over_menu){
    // if anything is selected
    if (selected!=noone&&!selected.locked){
        if (edit_is_moving){
            selected.x=World.xx;
            selected.y=World.yy;
            selected.z=World.zz;
            if (Controller.l2){      // Left shift
                editor_move_out();
            } else if (Controller.r2){      // Right shift
                editor_move_in();
            }
        }
        if (get_press_x()||keyboard_check_pressed(ord('F'))){
            editor_floor_object();
            edit_is_moving=false;
        }
        if (get_press_y()||keyboard_check_pressed(ord('M'))){
            edit_is_moving=!edit_is_moving;
        }
        editor_apply_transformation();
        // These need to go last, since they can change the state of the "selected" variable
        if (get_release_a()){
            editor_select(selected);
        }
        if (get_release_b()){
            editor_selection_clear();
        }
        if (get_release_select()){
            remove_entity(selected);
        }
        if (Controller.press_pleft){
        } else if (Controller.press_pright){
        } else if (Controller.press_pdown){
        } else if (Controller.press_pup){
        }
    }
}
