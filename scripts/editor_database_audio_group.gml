var start_x=W/4+64;
var start_y=64;
var end_x=W*3/4-64;
var end_y=H-64;

var ag=ds_map_find_value(all_mod_packages, edit_database_package).my_audio_groups[edit_database_active];

draw_text(start_x, start_y, "Internal Name: "+ag.internal_name);
draw_text(start_x, start_y+16, "Name: "+ag.name);
var suffix=ternary(string_length(ag.summary)>36, "...", "")
draw_text(start_x, start_y+32, "Summary: "+string_copy(ag.summary, 1, 36)+suffix);

draw_rectangle(start_x-16, start_y+48, end_x+16, end_y, true);
draw_text(start_x, start_y+64, "Songs: "+string(ds_list_size(ag.songs)));

var number_songs=(end_y-start_y-80) div 16;
for (var i=edit_database_ag_songs_start; i<min(ds_list_size(ag.songs), edit_database_ag_songs_start+number_songs); i++){
    var name=ag.packages[| i]+ ' \ '+ds_map_find_value(all_mod_packages, ag.packages[| i]).my_bgm[ag.songs[| i]].name;
    draw_text(start_x, start_y+80+(i-edit_database_ag_songs_start)*16, "["+string(i)+"]: "+name);
    if (i>0){
        draw_sprite_ext(spr_x_8, 0, end_x+4, start_y+80+(i-edit_database_ag_songs_start)*16, 1, 1, 0, c_red, 1);
    }
}

if (i<edit_database_ag_songs_start+number_songs){
    draw_text_colour(start_x, start_y+80+(i-edit_database_ag_songs_start)*16, "Add", c_blue, c_blue, c_blue, c_blue, 1);
}

switch (edit_database_overlay){
    case Misc.edit_db_overlay_none:
        // main variables
        if (mouse_within_rectangle(start_x, start_y, 80, start_y+40)){
            var n=clamp((MOUSE_Y-(start_y-8)) div 16, 0, 2);
            draw_rectangle(start_x-8, start_y-8+16*n, end_x-8, start_y+8+16*n, true);
            switch (n){
                case 0:
                    if (get_release_a()){
                        ag.internal_name=string_lettersdigits(get_string("The name that the game will refer to the audio group as internally? (Must be only letters or digits.)", ag.internal_name));
                    }
                    break;
                case 1:
                    if (get_release_a()){
                        ag.name=get_string("The name that players (may) see the audio groups as, in the Radio interface or elsewhere?", ag.name);
                    }
                    break;
                case 2:
                    if (get_release_a()){
                        ag.summary=get_string("A short description of the audio group. It's not that important and probably won't be seen by players but you never know.", ag.summary);
                    }
                    break;
            }
        // song list
        } else if (mouse_within_rectangle(start_x-16, start_y+72, end_x+16, end_y)){
            var max_n=min(ds_list_size(ag.songs)-edit_database_ag_songs_start+1, number_songs);
            var n=clamp((MOUSE_Y-start_y-72) div 16, 0, max_n-1);
            if (mouse_within_rectangle(end_x-4, start_y+72+n*16, end_x+12, start_y+88+n*16)){
                draw_rectangle(end_x-4, start_y+72+n*16, end_x+12, start_y+88+n*16, true);
                if (get_release_a()){
                    if (show_question("Do you really want to delete this item?")&&show_question("Like, really sure?")){
                        ds_list_delete(ag.packages, n+edit_database_ag_songs_start-1);
                        ds_list_delete(ag.songs, n+edit_database_ag_songs_start-1);
                    }
                }
            } else {
                draw_rectangle(start_x-8, start_y+72+16*n, end_x-8, start_y+88+16*n, true);
                if (get_release_a()){
                    if (n==max_n-1){
                        // Copy songs[0] because you know it has to exist I guess
                        ds_list_add(ag.packages, ag.packages[| 0]);
                        ds_list_add(ag.songs, ag.songs[| 0]);
                    } else {
                        edit_database_overlay=Misc.edit_db_overlay_ag_entry_new;
                        edit_database_ag_song_index=n+edit_database_ag_songs_start;
                        edit_database_filter="";
                    }
                } else if (mouse_wheel_up()){
                    edit_database_ag_songs_start=max(--edit_database_ag_songs_start, 0);
                } else if (mouse_wheel_down()){
                    edit_database_ag_songs_start=min(++edit_database_ag_songs_start, ds_list_size(ag.songs));
                } else if (keyboard_check_released(vk_home)){
                    edit_database_ag_songs_start=0;
                } else if (keyboard_check_released(vk_end)){
                    edit_database_ag_songs_start=ds_list_size(ag.songs);
                }
            }
        }
        break;
    case Misc.edit_db_overlay_ag_entry_song:
        if (editor_hud_database_resource_select(ag,
                "Pick a song: ",
                editor_hud_database_resource_ag_song_list,
                editor_hud_database_resource_ag_song_name,
                editor_hud_database_resource_ag_song_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_ag_entry_new:
        if (editor_hud_database_resource_select(ag,
                "Pick a package: ",
                editor_hud_database_resource_ag_package_list,
                editor_hud_database_resource_ag_package_name,
                editor_hud_database_resource_ag_package_set)){
            edit_database_overlay=Misc.edit_db_overlay_ag_entry_song;
        }
        break;
}
