var start_x=W/4+64;
var start_y=64;
var end_x=W*3/4-64;
var end_y=H-64;

var model=ds_map_find_value(all_mod_packages, edit_database_package).my_models[edit_database_active];

draw_text(start_x, start_y, "Internal Name: "+model.internal_name);
draw_text(start_x, start_y+16, "Name: "+model.name);
var suffix=ternary(string_length(model.summary)>36, "...", "")
draw_text(start_x, start_y+32, "Summary: "+string_copy(model.summary, 1, 36)+suffix);
draw_text(start_x, start_y+48, "Archive: "+model.archive);

draw_text(start_x, start_y+80, "Header Color:");
var sw=string_width("Header Color: ");
draw_rectangle_colour(start_x+sw, start_y+72, start_x+sw+16, start_y+88, model.color, model.color, model.color, model.color, false);
var c=rg[model.selectable];
draw_text_colour(start_x, start_y+96, "Selectable: "+tf[model.selectable], c, c, c, c, 1);
var c=rg[model.textured];
draw_text_colour(start_x, start_y+112, "Textured: "+tf[model.textured], c, c, c, c, 1);
draw_text(start_x, start_y+128, "Default Hit Script: "+script_get_name(all_hit_scripts[model.on_hit]));
draw_text(start_x, start_y+144, "Default Render Distance: "+string(model.model_render_distance));
var c=rg[(model.flag&ModelFlags.is_terrain)>0];
draw_text_colour(start_x, start_y+160, "Is Terrain: "+tf[(model.flag&ModelFlags.is_terrain)>0], c, c, c, c, 1);
var c=rg[(model.flag&ModelFlags.is_plant)>0];
draw_text_colour(start_x, start_y+176, "Is Plant: "+tf[(model.flag&ModelFlags.is_plant)>0], c, c, c, c, 1);

draw_text(start_x, start_y+208, "Format: "+model_format_names[model.format]);
draw_text_colour(start_x, start_y+224, "Triangles: "+string(model.triangles), c_gray, c_gray, c_gray, c_gray, 1);

draw_rectangle(start_x-16, start_y+240, end_x+16, end_y, true);
draw_text(start_x, start_y+256, "Collision/Block Model: "+model.cpath);

var number_paths=(end_y-start_y-272) div 16;
for (var i=edit_database_model_path_start; i<min(array_length_1d(model.path), edit_database_model_path_start+number_paths); i++){
    draw_text(start_x, start_y+272+(i-edit_database_model_path_start)*16, "["+string(i)+"]: "+model.path[i]);
    if (i>0){
        draw_sprite_ext(spr_x_8, 0, end_x+4, start_y+272+(i-edit_database_model_path_start)*16, 1, 1, 0, c_red, 1);
    }
}

if (i<edit_database_model_path_start+number_paths){
    draw_text_colour(start_x, start_y+272+(i-edit_database_model_path_start)*16, "Add", c_blue, c_blue, c_blue, c_blue, 1);
}

switch (edit_database_overlay){
    case Misc.edit_db_overlay_none:
        if (mouse_within_rectangle(start_x, start_y, end_x, start_y+232)){
            var n=clamp((MOUSE_Y-(start_y-8)) div 16, 0, 19);
            draw_rectangle(start_x-8, start_y-8+16*n, end_x-8, start_y+8+16*n, true);
            switch (n){
                case 0:
                    if (get_release_a()){
                        model.internal_name=string_lettersdigits(get_string("The name that the game will refer to the model as internally? (Must be only letters or digits.)", model.internal_name));
                    }
                    break;
                case 1:
                    if (get_release_a()){
                        model.name=get_string("The name that players (may) see the model as? It will serve as the default name when you place instances of the model in the world.", model.name);
                    }
                    break;
                case 2:
                    if (get_release_a()){
                        model.summary=get_string("A short description of the model. Will only be visible in the editor (or maybe elsewhere).", model.summary);
                    }
                    break;
                case 3:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_model_archive;
                        edit_database_filter="";
                    }
                    break;
                case 4:
                    // blank space
                    break;
                case 5:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_model_color;
                    }
                    break;
                case 6:
                    if (get_release_a()){
                        model.selectable=!model.selectable;
                    }
                    break;
                case 7:
                    if (get_release_a()){
                        model.textured=!model.textured;
                    }
                    break;
                case 8:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_model_hit_script;
                        edit_database_filter="";
                    }
                    break;
                case 9:
                    if (get_release_a()){
                        model.model_render_distance=clamp(get_integer("How far away this model can be viewed?", model.model_render_distance), 0, RD_EXTREMELY_FAR);
                    }
                    break;
                case 10:
                    if (get_release_a()){
                        model.flag=(model.flag^ModelFlags.is_terrain);
                    }
                    break;
                case 11:
                    if (get_release_a()){
                        model.flag=(model.flag^ModelFlags.is_plant);
                    }
                    break;
                case 12:
                    // blank space
                    break;
                case 13:
                    if (get_release_a()){
                        model.format=ternary(model.format==ModelFormats.d3d_model, ModelFormats.vertex_buffer, ModelFormats.d3d_model);
                    }
                    break;
                case 14:
                    // stat
                    break;
            }
        } else if (mouse_within_rectangle(start_x-16, start_y+248, end_x+16, end_y)){
            var max_n=min(array_length_1d(model.path)-edit_database_model_path_start+1, number_paths);
            var n=clamp((MOUSE_Y-start_y-248) div 16, 0, max_n);
            if ((n+edit_database_model_path_start-1)>0&&mouse_within_rectangle(end_x-4, start_y+248+n*16, end_x+12, start_y+264+n*16)){
                draw_rectangle(end_x-4, start_y+248+n*16, end_x+12, start_y+264+n*16, true);
                if (get_release_a()){
                    if (show_question("Do you really want to delete this?")&&show_question("Like, really sure?")){
                        model.path=array_remove(model.path, n+edit_database_model_path_start-1);
                        model.model_array=array_remove(model.model_array, n+edit_database_model_path_start-1);
                    }
                }
            } else {
                draw_rectangle(start_x-8, start_y+248+16*n, end_x-8, start_y+264+16*n, true);
                if (get_release_a()){
                    if (n==0){
                        edit_database_overlay=Misc.edit_db_overlay_model_collision;
                        edit_database_filter="C_";
                    } else if (n==max_n){
                        // Copy model_array[0] because you know it has to exist I guess
                        var len=array_length_1d(model.path);
                        model.path[len]=model.path[0];
                        model.model_array[len]=model.model_array[0];
                    } else {
                        edit_database_overlay=Misc.edit_db_overlay_model_visible;
                        edit_database_model_visible_index=n+edit_database_model_path_start-1;
                        edit_database_filter="";
                    }
                } else if (mouse_wheel_up()){
                    edit_database_model_path_start=max(--edit_database_model_path_start, 0);
                } else if (mouse_wheel_down()){
                    edit_database_model_path_start=min(++edit_database_model_path_start, array_length_1d(model.path));
                } else if (keyboard_check_released(vk_home)){
                    edit_database_model_path_start=0;
                } else if (keyboard_check_released(vk_end)){
                    edit_database_model_path_start=array_length_1d(model.path);
                }
            }
        }
        break;
    case Misc.edit_db_overlay_model_color:
        if (editor_database_color_picker(model)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_model_archive:
        if (editor_hud_database_resource_select(model,
                "Pick an archive: ",
                editor_hud_database_resource_model_vra_list,
                editor_hud_database_resource_model_vra_name,
                editor_hud_database_resource_model_vra_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_model_hit_script:
        if (editor_hud_database_resource_select(model,
                "Pick a hit script: ",
                editor_hud_database_resource_model_hit_script_list,
                editor_hud_database_resource_model_hit_script_name,
                editor_hud_database_resource_model_hit_script_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_model_collision:
        if (editor_hud_database_resource_select(model,
                "Pick a collision mesh: ",
                editor_hud_database_resource_model_collision_list,
                editor_hud_database_resource_model_collision_name,
                editor_hud_database_resource_model_collision_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_model_visible:
        if (editor_hud_database_resource_select(model,
                "Pick a visible mesh: ",
                editor_hud_database_resource_model_visible_list,
                editor_hud_database_resource_model_visible_name,
                editor_hud_database_resource_model_visible_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
}
