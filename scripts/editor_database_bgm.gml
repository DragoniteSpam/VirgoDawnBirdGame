var start_x=W/4+64;
var start_y=64;
var end_x=W*3/4-64;
var end_y=H-64;

var bgm=ds_map_find_value(all_mod_packages, edit_database_package).my_bgm[edit_database_active];

draw_text(start_x, start_y, "Internal Name: "+bgm.internal_name);
draw_text(start_x, start_y+16, "Name: "+bgm.name);
var suffix=ternary(string_length(bgm.summary)>36, "...", "")
draw_text(start_x, start_y+32, "Summary: "+string_copy(bgm.summary, 1, 36)+suffix);

var c=rg[bgm.internal_song];
draw_text_colour(start_x, start_y+64, "Internal song? "+tf[bgm.internal_song], c, c, c, c, 1);
c=ternary(bgm.internal_song, c_black, c_gray);
var text=ternary(bgm.internal_song, ternary(audio_exists(bgm.song), audio_get_name(bgm.song), "(not found)"), '---');
draw_text_colour(start_x, start_y+80, "Sound name: "+text, c, c, c, c, 1);
c=ternary(bgm.internal_song, c_gray, c_black);
text=ternary(bgm.internal_song, '---', bgm.path);
draw_text_colour(start_x, start_y+96, "File path: "+text, c, c, c, c, 1);
draw_text(start_x, start_y+112, "Artist: "+bgm.author);
c=rg[!audio_is_playing(bgm.song)];
text=ternary(audio_is_playing(bgm.song), "Stop", "Play");
draw_text_colour(start_x, start_y+128, text, c, c, c, c, 1);

switch (edit_database_overlay){
    case Misc.edit_db_overlay_none:
        if (mouse_within_rectangle(start_x, start_y, end_x, start_y+232)){
            var n=clamp((MOUSE_Y-(start_y-8)) div 16, 0, 8);
            draw_rectangle(start_x-8, start_y-8+16*n, end_x-8, start_y+8+16*n, true);
            switch (n){
                case 0:
                    if (get_release_a()){
                        bgm.internal_name=string_lettersdigits(get_string("The name that the game will refer to the music as internally? (Must be only letters or digits.)", bgm.internal_name));
                    }
                    break;
                case 1:
                    if (get_release_a()){
                        bgm.name=get_string("The name that players will see the music listed as, perhaps in the Radio interface or elsewhere?", bgm.name);
                    }
                    break;
                case 2:
                    if (get_release_a()){
                        bgm.summary=get_string("A short description of the music.", bgm.summary);
                    }
                    break;
                case 3:
                    // filler
                    break;
                case 4:
                    if (get_release_a()){
                        bgm.internal_song=!bgm.internal_song;
                    }
                    break;
                case 5:
                    if (get_release_a()){
                        if (bgm.internal_song){
                            edit_database_overlay=Misc.edit_db_overlay_bgm_bgm;
                        } else {
                            show_message("This Background Music is not set to use a song that is already part of the game files (the Internal Song setting) so you can't use this option right now.");
                        }
                    }
                case 6:
                    if (get_release_a()){
                        if (!bgm.internal_song){
                            var fn=get_open_filename("Ogg Vorbis audio files (*.ogg)|*.ogg|You can only use ogg sorry|*.ogg|mp3s are overrated okay|*.ogg|look i know they were popular in|*.ogg|the early 2000s but that doesnt|*.ogg|mean theyre a good file format|*.ogg", "");
                            if (file_exists(fn)){
                                bgm.path=filename_name(fn);
                                file_copy(fn, MOD_DIRECTORY+'\'+bgm.path);
                                if (bgm.loaded!=noone){
                                    audio_destroy_stream(bgm.loaded);
                                }
                                bgm.loaded=audio_create_stream(fn);
                                bgm.song=bgm.loaded;
                            }
                        } else {
                            show_message("This Background Music is set to use a song that is already part of the game files (the Internal Song setting) so you can't use this option right now.");
                        }
                    }
                    break;
                case 7:
                    if (get_release_a()){
                        bgm.author=get_string("Who wrote this music?", bgm.author);
                    }
                    break;
                case 8:
                    if (get_release_a()){
                        if (audio_is_playing(bgm.song)){
                            audio_stop_sound(bgm.song);
                        } else {
                            STOP_AUTO();
                            audio_play_sound(bgm.song, 1, false);
                        }
                    }
                    break;
            }
        }
        break;
    case Misc.edit_db_overlay_bgm_bgm:
        if (editor_hud_database_resource_select(model,
                "Internal BGM: ",
                editor_hud_database_resource_bgm_bgm_list,
                editor_hud_database_resource_bgm_bgm_name,
                editor_hud_database_resource_bgm_bgm_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
}
