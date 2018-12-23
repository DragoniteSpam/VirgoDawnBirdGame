// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

//draw_rectangle(0, 0, W, H, false);

// Location select

var start_x=32;
var start_y=32;

draw_rectangle_texture_auto(start_x, start_y, W/4, H-start_y, true);
draw_set_color(graphics_text_color);

draw_text(xstart+16, start_y+16, "Map Locations");
var n=0;
for (var i=edit_map_location_scroll_index; i<min(ds_list_size(lm.locations), edit_map_location_scroll_index+edit_map_location_scroll_max); i++){
    var c=ternary(lm.locations[| i]==edit_map_active_location, c_blue, c_black);
    draw_text_colour(start_x+16, start_y+32+16*n, lm.locations[| i].name, c, c, c, c, 1);
    n++;
}

// Could make this disappear if there's no space but I can't be bothered.
draw_text(start_x+16, start_y+32+16*n, "Add Location");

if (mouse_within_rectangle(start_x, start_y+32, W/4, H-start_y)){
    var index=(mouse_y-(start_y+32)) div 16;
    draw_rectangle(start_x+8, start_y+24+16*index, W/4-8, start_y+40+16*index, true);
    if (Controller.release_a){
        if (index==n){
            var number=ds_list_size(lm.locations);
            ds_list_add(lm.locations, add_location("Location"+string(number), number));
        } else if (index<n){
            edit_map_active_location=lm.locations[| index+edit_map_location_scroll_index];
        }
    }
    if (mouse_wheel_up()){
        edit_map_location_scroll_index=max(--edit_map_location_scroll_index, 0);
    } else if (mouse_wheel_down()){
        edit_map_location_scroll_index=min(++edit_map_location_scroll_index, ds_list_size(lm.locations));
    }
}

// Location settings

if (edit_map_active_location!=noone){
    var start_x=W/4+32;
    var h=384;
    if (string_width("Description: "+edit_map_active_location.summary)>W/2-64){
        var desc=string_copy(edit_map_active_location.summary, 1, 32)+"...";
    } else {
        var desc=edit_map_active_location.summary;
    }
    draw_rectangle_texture_auto(start_x, start_y, W*3/4-32, 384, true);
    draw_text(start_x+16, 48, "Location Settings");
    draw_text(start_x+16, 64, "Name: "+edit_map_active_location.name);
    draw_text(start_x+16, 80, "Description: "+desc);
    draw_text(start_x+16, 96, "Icon: "+background_get_name(edit_map_active_location.icon));
    draw_text(start_x+16, 112, "Music type: "+all_audio_groups[edit_map_active_location.music_type].name);
    draw_text(start_x+16, 128, "Environment: "+all_environments[edit_map_active_location.environment].name);
    draw_text(start_x+16, 144, "X: "+string(edit_map_active_location.x));
    draw_text(start_x+16, 160, "Y: "+string(edit_map_active_location.y));
    draw_text(start_x+16, 176, "Z: "+string(edit_map_active_location.z));
    draw_text_colour(start_x+16, 192, "Set Origin Here", c_gray, c_gray, c_gray, c_gray, 1);
    draw_text(start_x+16, 208, "Radius: "+string(edit_map_active_location.radius));
    draw_text(start_x+16, 224, "Radius (Load): "+string(edit_map_active_location.radius_load));
    draw_text_colour(start_x+16, 240, "Assign All Unassigned Selectables to Here", c_gray, c_gray, c_gray, c_gray, 1);
    draw_text_colour(start_x+16, 256, "Things: "+string(ds_list_size(edit_map_active_location.things)), c_gray, c_gray, c_gray, c_gray, 1);
    draw_text_colour(start_x+16, 272, "Force Load", c_gray, c_gray, c_gray, c_gray, 1);
    draw_text_colour(start_x+16, 288, "Force Unoad", c_gray, c_gray, c_gray, c_gray, 1);
    draw_text_colour(start_x+16, 304, "Force Unload All But This", c_gray, c_gray, c_gray, c_gray, 1);
    draw_text(start_x+16, 320, "Set Teleport Coordinates ["+string(floor(edit_map_active_location.teleport_x))+","+
        string(floor(edit_map_active_location.teleport_y))+","+string(floor(edit_map_active_location.teleport_z))+"@"+
        string(floor(edit_map_active_location.teleport_direction))+"]");
    draw_text_colour(start_x+16, 336, "Teleport to Here", c_blue, c_blue, c_blue, c_blue, 1);
    draw_text_colour(start_x+16, 352, "Delete", c_red, c_red, c_red, c_red, 1);
    
    if (mouse_within_rectangle(start_x, start_y, W*3/4-32, 384)){
        var index=(mouse_y-(start_y+32)) div 16;
        draw_rectangle(start_x+8, start_y+24+16*index, W*3/4-40, start_y+40+16*index, true);
        switch (index){
            case 0:
                if (Controller.release_a){
                    edit_map_active_location.name=get_string("New name for this location?", edit_map_active_location.name);
                }
                break;
            case 1:
                if (Controller.release_a){
                    edit_map_active_location.summary=get_string("New description for this location? (Should be brief.)", edit_map_active_location.summary);
                }
                break;
            case 2:
                if (Controller.release_a){
                    var str=get_string("New icon for this location? (This is unmoderated but should be one of the b_icon_* backgrounds.)", background_get_name(edit_map_active_location.icon));
                    for (var i=0; i<array_length_1d(all_location_icons); i++){
                        if (background_get_name(all_location_icons[i]==str)){
                            edit_map_active_location.icon=all_location_icons[i];
                            break;
                        }
                    }
                } else if (Controller.release_left){
                    edit_map_active_location.icon=(--edit_map_active_location.icon+array_length_1d(all_location_icons))%array_length_1d(all_location_icons);
                } else if (Controller.release_right){
                    edit_map_active_location.icon=(edit_map_active_location.icon)%array_length_1d(all_location_icons);
                }
                break;
            case 3:
                if (Controller.release_a){
                    edit_map_active_location.music_type=get_audio_group_from_name(get_string("New music group?", all_audio_groups[edit_map_active_location.music_type].name), edit_map_active_location.music_type);
                }
                if (Controller.release_left){
                    edit_map_active_location.music_type=(--edit_map_active_location.music_type+array_length_1d(all_audio_groups))%array_length_1d(all_audio_groups);
                } else if (Controller.release_right){
                    edit_map_active_location.music_type=(++edit_map_active_location.music_type)%array_length_1d(all_audio_groups);
                }
                break;
            case 4:
                if (Controller.release_a){
                    edit_map_active_location.environment=get_environment_from_name(get_string("New environment?", all_environments[edit_map_active_location.environment].name), edit_map_active_location.environment);
                }
                if (Controller.release_left){
                    edit_map_active_location.environment=(--edit_map_active_location.environment+array_length_1d(all_environments))%array_length_1d(all_environments);
                } else if (Controller.release_right){
                    edit_map_active_location.environment=(++edit_map_active_location.environment)%array_length_1d(all_environments);
                }
                break;
            case 5:
                if (Controller.release_a){
                    edit_map_active_location.x=get_integer("New X location?", edit_map_active_location.x);
                }
                break;
            case 6:
                if (Controller.release_a){
                    edit_map_active_location.y=get_integer("New Y location?", edit_map_active_location.y);
                }
                break;
            case 7:
                if (Controller.release_a){
                    edit_map_active_location.z=get_integer("New Z location?", edit_map_active_location.z);
                }
                break;
            case 8:
                if (Controller.release_a){
                    if (show_question("Are you certain?")){
                        edit_map_active_location.x=Camera.x;
                        edit_map_active_location.y=Camera.y;
                        edit_map_active_location.z=Camera.z;
                    }
                }
                break;
            case 9:
                if (Controller.release_a){
                    edit_map_active_location.radius=get_integer("New location radius? (If you're within this 3D radius you're considered inside this location. The sign will appear when you enter. Try not to have overlapping locations.)", edit_map_active_location.radius);
                }
                break;
            case 10:
                if (Controller.release_a){
                    edit_map_active_location.radius_load=get_integer("New location load radius? (This is how close you have to be for it to be loaded into the game. It also determines how far away you can see it in your compass.)", edit_map_active_location.radius_load);
                }
                break;
            case 11:
                // Thing count
                break;
            case 12:
                if (Controller.release_a){
                    with (Selectable) if (location==-1&&deleteable){
                        location=World.edit_map_active_location.index;
                        ds_list_add(World.edit_map_active_location.things, id);
                    }
                }
                break;
            case 13:
                if (Controller.release_a){
                    with (edit_map_active_location){
                        location_load();
                    }
                }
                break;
            case 14:
                if (Controller.release_a){
                    with (edit_map_active_location){
                        location_unload();
                    }
                }
                break;
            case 15:
                if (Controller.release_a){
                    for (var i=0; i<ds_list_size(lm.locations); i++){
                        if (lm.locations[| i]!=edit_map_active_location){
                            with (lm.locations[| i]){
                                location_unload();
                            }
                        }
                    }
                }
                break;
            case 16:
                if (get_release_a()){
                    if (show_question("Would you like to set the teleport coordinates for this Location to the Camera position?")){
                        edit_map_active_location.teleport_x=Camera.x;
                        edit_map_active_location.teleport_y=Camera.y;
                        edit_map_active_location.teleport_z=Camera.z-EYE_LEVEL;
                        edit_map_active_location.teleport_direction=Camera.direction;
                        show_message("Be sure to save!");
                    }
                }
                break;
            case 17:
                if (get_release_a()&&show_question("Teleport to "+edit_map_active_location.name+"?")){
                    World.vars[0]=edit_map_active_location;
                    Player.cutscene_index=get_cutscene_from_name("Fast Travel", 0);
                    with (Player){
                        scr_cutscene_launch(Player.cutscene_index);
                    }
                }
                break;
            case 18:
                if (Controller.release_a){
                    if (show_question("Are you sure? This will delete "+string(ds_list_size(edit_map_active_location.things))+" Selectables with it!")){
                        if (show_question("Like, really sure?")){
                            with (edit_map_active_location){
                                instance_destroy();
                            }
                        }
                    }
                }
                break;
        }
    }
}

// Map Settings

var start_x=W*3/4
var h=384;
draw_rectangle_texture_auto(start_x, 32, W-32, h, true);
draw_set_color(graphics_text_color);

draw_text(start_x+16, 48, "Map Settings");
draw_text(start_x+16, 64, "Name: "+lm.name);
draw_text(start_x+16, 80, "Indoors? "+tf[lm.is_indoors]);
draw_text(start_x+16, 96, "Draw water? "+tf[lm.draw_water]);
draw_text(start_x+16, 112, "Render Distance: "+string(lm.map_render_distance));
draw_text(start_x+16, 128, "Can Fast Travel: "+tf[lm.can_fast_travel]);

if (mouse_within_rectangle(start_x, 56, W-32, h-8)){
    mouse_over_menu=true;
    var hovering=(MOUSE_Y-56) div 16;
    draw_rectangle(start_x+8, 54+16*hovering, W-40, 74+16*hovering, true);
    if (Controller.press_a){
        switch (hovering){
            case 0:
                lm.name=get_string_c("Map name?", lm.name);
                break;
            case 1:
                lm.is_indoors=!lm.is_indoors;
                break;
            case 2:
                lm.draw_water=!lm.draw_water;
                break;
            case 3:
                switch (lm.map_render_distance){
                    case RD_STUPIDLY_NEAR:
                        lm.map_render_distance=RD_EXTREMELY_NEAR;
                        break;
                    case RD_EXTREMELY_NEAR:
                        lm.map_render_distance=RD_NEAR;
                        break;
                    case RD_NEAR:
                        lm.map_render_distance=RD_STANDARD;
                        break;
                    case RD_STANDARD:
                        lm.map_render_distance=RD_FAR;
                        break;
                    case RD_FAR:
                        lm.map_render_distance=RD_EXTREMELY_FAR;
                        break;
                    case RD_EXTREMELY_FAR:
                        lm.map_render_distance=RD_STUPIDLY_NEAR;
                        break;
                }
                break;
            case 4:
                lm.can_fast_travel=!lm.can_fast_travel;
                break;
        }
    }
}
