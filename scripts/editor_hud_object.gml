// header
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var h=H-32;

//////////////////////////////////////////
// List of things that you can click on //
//////////////////////////////////////////

if (edit_object_base){
    draw_rectangle_texture_auto(32, 32, W/4, h, true);
    draw_set_color(graphics_text_color);
    draw_text(48, 48, "Models"); // <--------------------------
    
    // things
    var arr=ds_map_find_value(all_mod_packages, edit_menu_mod_package).my_models;
    for (var i=edit_menu_start; i<min(array_length_1d(arr), edit_menu_start+EDIT_MENU_LIMIT); i++){
        var m=arr[i];
        draw_text_colour(48, 80+16*(i-edit_menu_start) ,string(i)+'. '+m.name, m.color, m.color, m.color, m.color, true);
    }
    
    if (mouse_within_rectangle(32, 56, W/4, h)){
        mouse_over_menu=true;
        // this technically should have a min(length of model array) with it, but the model array is always going to be way longer than that
        var hovering=clamp((MOUSE_Y-72) div 16, 0, EDIT_MENU_LIMIT-1);
        var m=arr[hovering+edit_menu_start];
        draw_rectangle(40, 70+16*hovering, W/4-8, 90+16*hovering, true);
        if (hovering>=0){
            if (get_release_a()&&m.selectable){
                if (selected==noone){
                    editor_select(add_entity(hovering+edit_menu_start, irandom(array_length_1d(m.model_array)-1), xx, yy, zz));
                    edit_is_moving=true;
                } else {
                    if (instanceof(selected, Entity)){
                        with (selected){
                            model=hovering+World.edit_menu_start;
                            model_index=irandom(array_length_1d(m.model_array)-1);
                            script_execute(collision_remover, id);
                            script_execute(collision_adder, id);
                        }
                    }
                }
            } else if (get_release_b()){
                if (show_question("Check all Entities with "+arr[hovering+edit_menu_start].name+" as its Model?")){
                    for (var i=0; i<instance_number(Entity); i++){
                        var ent=instance_find(Entity, i);
                        if (ent.mod_package==edit_menu_mod_package&&ent.model==(hovering+edit_menu_start)){
                            ent.checked=true;
                        }
                    }
                }
            }
        }
        draw_rectangle_texture_auto(W/4+8, 32, W/2, 184, true);
        draw_text(W/4+32, 48, m.name);
        draw_set_valign(fa_top);
        draw_text_ext(W/4+32, 64, m.summary, -1, W/4-64);
        draw_set_valign(fa_middle);
        if (Controller.l3){
            Controller.l3=false;
            edit_menu_start=max(--edit_menu_start, 0);
        } else if (Controller.r3){
            Controller.r3=false;
            edit_menu_start=min(++edit_menu_start, array_length_1d(arr)-EDIT_MENU_LIMIT);
        } else if (keyboard_check_released(vk_pageup)){
            edit_menu_start=max(edit_menu_start-20, 0);
        } else if (keyboard_check_released(vk_pagedown)){
            edit_menu_start=min(edit_menu_start+20, array_length_1d(arr)-EDIT_MENU_LIMIT);
        } else if (keyboard_check_released(vk_numpad0)){
            edit_menu_start=Models.PLACE_GENERAL;
        } else if (keyboard_check_released(vk_numpad1)){
            edit_menu_start=Models.PLACE_COMPOUND;
        }
    }
} else {
    draw_rectangle_texture_auto(32, 32, W/4, h, true);
    draw_set_color(graphics_text_color);
    draw_text(48, 48, "Model Templates"); // <--------------------------
    
    // things
    for (var i=edit_menu_start_template; i<min(array_length_1d(all_model_templates), edit_menu_start_template+EDIT_MENU_LIMIT); i++){
        var m=all_model_templates[i];
        draw_text_colour(48, 80+16*(i-edit_menu_start_template), string(i)+'. '+m.name, m.color, m.color, m.color, m.color, true);
    }
    
    if (mouse_within_rectangle(32, 56, W/4, h)){
        mouse_over_menu=true;
        var hovering=clamp((MOUSE_Y-72) div 16, 0, min(EDIT_MENU_LIMIT, array_length_1d(all_model_templates))-1);
        draw_rectangle(40, 70+16*hovering, W/4-8, 90+16*hovering, true);
        if (get_release_a()){
            editor_select(add_entity_template(hovering+edit_menu_start_template, xx, yy, zz));
            edit_is_moving=true;
        }
        draw_rectangle_texture_auto(W/4+8, 32, W/2, 184, true);
        var mt=all_model_templates[hovering+edit_menu_start_template];
        draw_text(W/4+32, 48, mt.name);
        draw_set_valign(fa_top);
        draw_text_ext(W/4+32, 64, mt.summary, -1, W/4-64);
        draw_set_valign(fa_middle);
        if (Controller.l3){
            Controller.l3=false;
            edit_menu_start_template=max(edit_menu_start_template-1, 0);
        } else if (Controller.r3){
            Controller.r3=false;
            edit_menu_start_template=min(edit_menu_start_template+1, array_length_1d(all_model_templates)-EDIT_MENU_LIMIT);
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

if (instance_exists(obj)){
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
    if (selected!=noone){
        if (!selected.locked){
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
            if (keyboard_check_pressed(ord('R'))){
                selected.direction=(selected.direction div 90)*90;
                selected.direction=(90+selected.direction)%360;
            }
            if (keyboard_check_pressed(ord('T'))){
                editor_object_template_split(selected);
            }
            if (keyboard_check_direct(vk_lalt)){
                editor_rotate_ccw(Misc.rotate_axis_z);
            } else if (keyboard_check_direct(vk_ralt)){
                editor_rotate_cw(Misc.rotate_axis_z);
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
                if (!instanceof(selected, EntityTemplate)){
                    var len=array_length_1d(selected.model.model_array);
                    selected.model_index=(selected.model_index+len-1)%len;
                }
            } else if (Controller.press_pright){
                if (!instanceof(selected, EntityTemplate)){
                    selected.model_index=(selected.model_index+1)%array_length_1d(get_model_object(selected).model_array);
                }
            } else if (Controller.press_pdown){
            } else if (Controller.press_pup){
            }
            if (Controller.CONTROL&&keyboard_check_direct(ord('C'))){
                edit_object_clipboard_model=selected.model;
                edit_object_clipboard_xrot=selected.xrot;
                edit_object_clipboard_yrot=selected.yrot;
                edit_object_clipboard_zrot=selected.direction;
                edit_object_clipboard_name=selected.name;
                edit_object_clipboard_cutscene=selected.cutscene_index;
                edit_object_clipboard_text=selected.text;
            }
        } else {
            // These can still happen, even if the selected entity is locked
            if (get_release_a()){
                editor_select(selected);
            }
            if (get_release_b()){
                editor_selection_clear();
            }
            if (get_release_select()){
                if (show_question("The selected entity is locked! Are you sure you want to delete it?")){
                    remove_entity(selected);
                }
            }
        }
    // if nothing is currently selected
    } else {
        if (get_release_a()){
            if (ray_object==noone){
                editor_select(add_entity(edit_object_last_added,
                    irandom(array_length_1d(arr[edit_object_last_added].model_array)-1), xx, yy, zz));
            } else {
                editor_select(ray_object);
            }
        } else {
            if (Controller.CONTROL&&keyboard_check_direct(ord('V'))&&edit_object_clipboard_model!=Models.none){
                editor_select(add_entity(edit_object_clipboard_model,
                    irandom(array_length_1d(arr[edit_object_clipboard_model].model_array)-1), xx, yy, zz));
                selected.xrot=edit_object_clipboard_xrot;
                selected.yrot=edit_object_clipboard_yrot;
                selected.direction=edit_object_clipboard_zrot;
                selected.name=edit_object_clipboard_name;
                selected.cutscene_index=edit_object_clipboard_cutscene;
                selected.text=edit_object_clipboard_text;
                edit_is_moving=true;
            }
        }
    }
}

if (get_release_select()){
    edit_object_base=!edit_object_base;
}
