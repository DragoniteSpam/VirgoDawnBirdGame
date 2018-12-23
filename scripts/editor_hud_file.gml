// header
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

switch (edit_file_page){
    case Misc.edit_file_page_default:
        var h=256;
        draw_rectangle_texture_auto(32, 32, W/4, H/2-16, false);
        draw_set_color(graphics_text_color);
        draw_text(48, 48, "Select something.");
        draw_text(48, 64, "Editor lighting: "+tf[editor_lighting]);
        draw_text(48, 80, "");
        draw_text(48, 96, "Save Editor Settings");
        draw_text(48, 112, "Export Game Text");
        draw_text(48, 128, "Export Current Map");
        draw_text(48, 144, "Export Main Data");
        draw_text(48, 160, "Export Cutscenes");
        draw_text(48, 176, "Export Misc. Data");
        
        if (mouse_within_rectangle(32, 56, W/4, h-8)){
            mouse_over_menu=true;
            var hovering=clamp((MOUSE_Y-56) div 16, 0, 7);
            draw_rectangle(40, 54+16*hovering, W/4-8, 72+16*hovering, true);
            if (Controller.press_a){
                switch (hovering){
                    case 0:
                        editor_lighting=!editor_lighting;
                        break;
                    case 1:
                        // currently empty space
                        break;
                    case 2:
                        editor_save_settings();
                        break;
                    case 3:
                        editor_save_text();
                        break;
                    case 4:
/*                        var fn=get_save_filename("Map files (*."+MAP_FILE_EXTENSION+")|*."+MAP_FILE_EXTENSION, "");
                        if (fn!=""){
                            map_write_current(fn);
                        }*/
                        map_write_current(CACHE_DIRECTORY+'\'+lm.internal_name+MAP_FILE_EXTENSION);
                        break;
                    case 5:
                        /**
                         * Items
                         * Models
                         * Audio Groups
                         * Background Music
                         * NPCs
                         * Cooking Recipes
                         * Item Effects
                         * Maps
                         * Pressure Plate Actions
                         * (add more as more are added)
                         */
                        var fn=get_save_filename("Virgo main data files (*.main.virgo)|*.main.virgo", "birdgame");
                        if (fn!=''){
                            editor_save_main(fn);
                        }
                        break;
                    case 6:
                        editor_save_cutscenes();
                        break;
                    case 7:
                        /**
                         * Teleport spots
                         * (populate this list with other things found in here)
                         */
                        var fn=get_save_filename("Virgo data files (*.virgo)|*.virgo", "misc.virgo");
                        if (fn!=''){
                            editor_save_data(fn);
                        }
                        break;
                    // more to follow, maybe
                }
            }
        }
        
        var h=256;
        draw_rectangle_texture_auto(32, H/2, W/4, H/2+h, false);
        draw_text(48, H/2+16, "Delete All Entities");
        draw_text(48, H/2+32, "Lock All Entities");
        draw_text(48, H/2+48, "Reset Active Player");
        draw_text(48, H/2+64, "Set Teleport Spot");
        draw_text(48, H/2+80, "Rename Teleport Spot");
        
        if (mouse_within_rectangle(32, H/2, W/4, H/2+h)){
            mouse_over_menu=true;
            var hovering=clamp((MOUSE_Y-(H/2+16)) div 16, 0, 4);
            draw_rectangle(40, H/2+8+16*hovering, W/4-8, H/2+24+16*hovering, true);
            if (Controller.press_a){
                switch (hovering){
                    case 0:
                        if (show_question("Uh, are you sure you want to delete all entities?")){
                            if (show_question("Like, reeeeeeally sure?")){
                                with (Selectable) if (deleteable){
                                    instance_destroy();
                                }
                            }
                        }
                        break;
                    case 1:
                        // NPCs shouldn't be (automatically) locked because then they can't walk around
                        with (Selectable) if (deleteable&&!instanceof(EntityNPC)){
                            locked=true;
                        }
                        break;
                    case 2:
                        register(Player.id, BASE_ASSET, NPCs.ActivePlayer);
                        break;
                    case 3:
                        editor_set_teleport_spot();
                        break;
                    case 4:
                        editor_rename_teleport_spot();
                        break;
                }
            }
        }
        
        draw_rectangle_texture_auto(W/4+32, H/2, W/2, H/2+h, false);
        
        draw_text(W/4+48, H/2+16, "Merge Selected Entities");
        draw_text(W/4+48, H/2+32, "Selected Entity Barycenter");
        draw_text(W/4+48, H/2+48, "Delete Entities");
        draw_text(W/4+48, H/2+64, "Strip Cutscene Data");
        draw_text(W/4+48, H/2+80, "Select All Of . . .");
        draw_text(W/4+48, H/2+96, "Select All Hidden");
        draw_text(W/4+48, H/2+112, "Randomize Model Indices");
        
        if (mouse_within_rectangle(W/4+32, H/2, W/2, H/2+h)){
            mouse_over_menu=true;
            var hovering=clamp((MOUSE_Y-(H/2+16)) div 16, 0, 6);
            draw_rectangle(W/4+40, H/2+8+16*hovering, W/2-8, H/2+24+16*hovering, true);
            if (Controller.press_a){
                switch (hovering){
                    case 0:
                        editor_save_merge();
                        break;
                    case 1:
                        editor_save_barycenter();
                        break;
                    case 2:
                        editor_delete_checked();
                        break;
                    case 3:
                        editor_selected_strip();
                        break;
                    case 4:
                        editor_select_x();
                        break;
                    case 5:
                        editor_select_hidden();
                        break;
                    case 6:
                        editor_selected_randomize();
                        break;
                }
            }
        }
        
        draw_rectangle_texture_auto(W/2+32, H/2, W*3/4, H/2+h, false);
        
        draw_text_colour(W/2+48, H/2+16, "Mod Stuff", c_blue, c_blue, c_blue, c_blue, 1);
        draw_text(W/2+48, H/2+32, "Active Mod: "+mod_internal_name);
        draw_text(W/2+48, H/2+48, "New Mod Package");
        draw_text(W/2+48, H/2+64, "Add 3D Model Collection");
        
        if (mouse_within_rectangle(W/2+32, H/2, W*3/4, H/2+h)){
            mouse_over_menu=true;
            var hovering=clamp((MOUSE_Y-(H/2+24)) div 16, 0, 2);
            draw_rectangle(W/2+40, H/2+24+16*hovering, W*3/4-8, H/2+40+16*hovering, true);
            if (Controller.press_a){
                switch (hovering){
                    case 0:
                        edit_file_page=Misc.edit_file_page_mod_select;
                        break;
                    case 1:
                        editor_mod_new();
                        break;
                    case 2:
                        editor_add_vra();
                        break;
                }
            }
        }
        break;
    case Misc.edit_file_page_mod_select:
        draw_rectangle_texture_auto(32, 32, W/4, H/2-16, false);
        draw_set_color(graphics_text_color);
        draw_text(48, 48, "Select a mod.");
        for (var i=edit_file_mod_list_start; i<min(array_length_1d(all_mod_packages_array), edit_file_mod_list_start+edit_file_mod_list_limit); i++){
            var screen_i=i-edit_file_mod_list_start;
            draw_text(48, 64+16*screen_i, all_mod_packages_array[i].name);
            if (all_mod_packages_array[i].name==mod_internal_name){
                draw_rectangle(40, 56+16*screen_i, W/4-32, 72+16*screen_i, true);
            }
        }
        if (mouse_within_rectangle(32, 32, W/4, H/2-16)){
            var index=min(clamp((MOUSE_Y-56) div 16, 0, edit_file_mod_list_limit-1)+edit_file_mod_list_start, array_length_1d(all_mod_packages_array)-1);
            if (get_release_a()){
                mod_internal_name=all_mod_packages_array[index].name;
                editfile_page=Misc.edit_file_page_default;
            } else if (mouse_wheel_up()){
                edit_file_mod_list_start=max(--edit_file_mod_list_start, 0);
            } else if (mouse_wheel_down()){
                edit_file_mod_list_start=clamp(++edit_file_mod_list_start, 0, max(array_length_1d(all_mod_packages_array)-edit_file_mod_list_limit, 0))
            } else if (keyboard_check_released(vk_pageup)){
                edit_file_mod_list_start=max(edit_file_mod_list_start-10, 0);
            } else if (keyboard_check_released(vk_pagedown)){
                edit_file_mod_list_start=clamp(edit_file_mod_list_start+10, 0, max(array_length_1d(all_mod_packages_array)-edit_file_mod_list_limit, 0))
            } else if (keyboard_check_released(vk_home)){
                edit_file_mod_list_start=0;
            } else if (keyboard_check_released(vk_end)){
                edit_database_start=max(array_length_1d(all_mod_packages_array)-edit_file_mod_list_limit+1, 0);
            }
        }
        if (Controller.release_select){
            edit_file_page=Misc.edit_file_page_default;
        }
        break;
}
