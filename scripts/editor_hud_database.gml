// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var start_x=32;
var h=H-32;

/*
 * Drawing the side panel
 */

draw_rectangle_colour(0, 0, W, H, c_white, c_white, c_white, c_white, false);
draw_rectangle_texture_auto(start_x, 32, W/4, H-32, true);
draw_set_color(graphics_text_color);

// If you're in the Mod List panel
if (edit_database_show_mods){
    var array=all_mod_packages_array;
    var name="Mods";
    var name_singular="Mod";
    var database_script=null;
    var replace_script=null;
    var add_script=null;
    var required=noone;
    
    draw_text(start_x+16, 48, "Active Mods");
    var lim=min(array_length_1d(array), edit_database_start+edit_database_limit);
    for (var i=edit_database_start; i<lim; i++){
        draw_text(start_x+16, 64+16*(i-edit_database_start), "["+string(i)+"] "+array[i].name);
        if (edit_database_package==array[i].name){
            draw_rectangle(start_x+8, 56+16*i, W/4-32, 72+16*i, true);
        }
    }
// If you're not in the Mod List panel
} else {
    switch (edit_database_mode){
        case Database.items:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_items;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_items;
            var name="Items";
            var name_singular="Item";
            var database_script=editor_database_item;
            var replace_script=editor_replace_item;
            var add_script=editor_add_item;
            break;
        case Database.models:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_models;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_models;
            var name="Models";
            var name_singular="Model";
            var database_script=editor_database_model;
            var replace_script=editor_replace_model;
            var add_script=editor_add_model;
            break;
        case Database.audio_groups:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_audio_groups;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_audio_groups;
            var name="Audio Groups";
            var name_singular="Audio Group";
            var database_script=editor_database_audio_group;
            var replace_script=editor_replace_audio_group;
            var add_script=editor_add_audio_group;
            break;
        case Database.bgm:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_bgm;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_bgm;
            var name="Background Music";
            var name_singular=name;
            var database_script=editor_database_bgm;
            var replace_script=editor_replace_bgm;
            var add_script=editor_add_bgm;
            break;
        case Database.npcs:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_npcs;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_npcs;
            var name="NPCs/Actors";
            var name_singular="NPC/Actor";
            var database_script=editor_database_npc;
            var replace_script=editor_replace_npc;
            var add_script=editor_add_npc;
            break;
        case Database.recipes:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_recipes;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_recipes;
            var name="Cooking Recipes";
            var name_singular="Cooking Recipe";
            var database_script=editor_database_recipe;
            var replace_script=editor_replace_recipe;
            var add_script=editor_add_recipe;
            break;
        case Database.item_effects:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_item_effects;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_item_effects;
            var name="Item Effects";
            var name_singular="Item Effect";
            var database_script=editor_database_item_effect;
            var replace_script=editor_replace_item_effect;
            var add_script=editor_add_item_effect;
            break;
        case Database.maps:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_maps;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_maps;
            var name="Maps";
            var name_singular="Map";
            var database_script=editor_database_map;
            var replace_script=editor_replace_map;
            var add_script=editor_add_map;
            break;
        case Database.pressure_plate_actions:
            var array=ds_map_find_value(all_mod_packages, edit_database_package).my_pressure_plate_actions;
            var required=ds_map_find_value(all_mod_packages, mod_internal_name).required_pressure_plate_actions;
            var name="Pressure Plate Actions";
            var name_singular="Pressure Plate Action";
            var database_script=editor_database_pressure_plate_action;
            var replace_script=editor_replace_pressure_plate_action;
            var add_script=editor_add_pressure_plate_action;
            break;
    }
    
    draw_text(start_x+16, 48, "Database: "+name);
    var lim=min(array_length_1d(array), edit_database_start+edit_database_limit);
    for (var i=edit_database_start; i<lim; i++){
        if (ds_map_exists(required, edit_database_package+"."+array[i].name)){
            var status='*';
        } else {
            var status='';
        }
        draw_text(start_x+16, 64+16*(i-edit_database_start), "["+string(i)+status+"] "+array[i].name);
        if (array[i].mod_package==BASE_ASSET||i==0){
            draw_sprite_ext(spr_essential_8, 0, W/4-16, 64+16*(i-edit_database_start), 1, 1, 0, c_blue, 1);
        } else {
            draw_sprite_ext(spr_x_8, 0, W/4-16, 64+16*(i-edit_database_start), 1, 1, 0, c_red, 1);
        }
    }
    if (i==array_length_1d(array)){
        draw_text_colour(start_x+32, 64+16*(i-edit_database_start), "  New "+name_singular, c_blue, c_blue, c_blue, c_blue, 1);
    }
    
    var i=edit_database_active-edit_database_start;
    if (i>=0&&i<min(array_length_1d(array)-1-edit_database_start, edit_database_limit)){
        draw_rectangle(start_x+8, 56+16*i, W/4-32, 72+16*i, true);
    }
}

/*
 * Processing the side panel
 */

if (mouse_within_rectangle(start_x, 32, W/4, H-32)){
    if (edit_database_overlay==Misc.edit_db_overlay_none){
        var my=clamp((MOUSE_Y-56) div 16, 0, edit_database_limit-1);
        draw_rectangle(start_x+8, 56+16*my, W/4-32, 72+16*my, true);
        var index=my+edit_database_start;
        if (!edit_database_show_mods){
            if (index<array_length_1d(array)){
                // clicking the little "x"
                if (mouse_within_rectangle(W/4-16-8, 64+16*my-8, W/4-16+8, 64+16*my+8)){
                    draw_rectangle(W/4-16-8, 64+16*my-8, W/4-16+8, 64+16*my+8, true);
                    if (array[index].mod_package==BASE_ASSET){
                        if (get_release_a()){
                            show_message(array[index].name+" is a base asset. You may modify it, but not delete it.");
                        }
                    } else if (index==0){
                        if (get_release_a()){
                            show_message(array[index].name+" is the default "+name+" for "+edit_database_package+". You may modify it, but not delete it.");
                        }
                    } else {
                        if (get_release_a()){
                            if (show_question("Do you really want to delete "+array[index].name+"?")&&show_question("Like, really sure?")&&show_question("Seriously, if there are any references to this resource still in existence you could crash the game.")){
                                instance_activate_object(array[index]);
                                with (array[index]){
                                    instance_destroy();
                                }
                                var new_array=array_remove(array, index);
                                script_execute(replace_script, new_array);
                                if (edit_database_active>=array_length_1d(new_array)){
                                    edit_database_active=array_length_1d(new_array)-1;
                                }
                            }
                        }
                    }
                }
            }
            if (get_release_a()){
                // Add a new instance of the asset
                if (index==array_length_1d(array)){
                    var asset=script_execute(add_script);
                    asset.mod_package=World.mod_internal_name;
                // Set the active asset
                } else if (index<array_length_1d(array)){
                    edit_database_active=clamp(my+edit_database_start, edit_database_start, edit_database_start+edit_database_limit-1);
                }
            } else if (get_release_b()){
                if (index<array_length_1d(array)){
                    if (index==0){
                        show_message("(There's really no point to marking a mod package as requiring someone else's null asset.)");
                    } else if (array[index].mod_package==mod_internal_name){
                        show_message("(There's really no point to marking a mod package as requiring one of its own assets.)")
                    } else if (mod_internal_name==BASE_ASSET){
                        show_message("(There's really no point to marking the base package as requiring someone else's assets.)");
                    } else {
                        var str=edit_database_package+"."+array[index].internal_name;
                        if (ds_map_exists(required, str)){
                            ds_map_delete(required, str);
                        } else {
                            // it doesn't really matter what you put in the array, since it just needs
                            // the key to exist i guess
                            ds_map_add(required, str, str);
                        }
                    }
                }
            }
        } else {
            if (get_release_a()&&index<array_length_1d(array)){
                edit_database_package=array[index].name;
            }
        }
        
        if (mouse_wheel_up()){
            edit_database_start=max(--edit_database_start, 0);
        } else if (mouse_wheel_down()){
            edit_database_start=clamp(++edit_database_start, 0, max(array_length_1d(array)-edit_database_limit, 0));
        } else if (keyboard_check_released(vk_pageup)){
            edit_database_start=max(edit_database_start-10, 0);
        } else if (keyboard_check_released(vk_pagedown)){
            edit_database_start=clamp(edit_database_start+10, 0, max(array_length_1d(array)-edit_database_limit, 0));
        } else if (keyboard_check_released(vk_home)){
            edit_database_start=0;
        } else if (keyboard_check_released(vk_end)){
            edit_database_start=max(array_length_1d(array)-edit_database_limit+1, 0);
        } else if (Controller.release_select){
            edit_database_show_mods=!edit_database_show_mods;
            edit_database_start=0;
            edit_database_active=0;
        }
    }
}

start_x=W/4+32;

// lazy way to check for deletions
//edit_database_active=clamp(edit_database_active, 0, max(array_length_1d(array)-1, 0));

if (!edit_database_show_mods){
    draw_rectangle(start_x, 32, W*3/4-32, H-32, true);
    script_execute(database_script);
}

/*
 * The database type panel thing on the right
 */

start_x=W*3/4;
draw_rectangle_texture_auto(start_x, 32, W-32, H/2+100, true);

// this is a tiny bit inefficient since we're creating and destroying a list every frame but it's
// part of the editor so I don't really care.
var list=ds_list_create();
ds_list_add(list,
/* 00 */"AudioGroups",
/* 01 */"Background Music",
/* 02 */"Cooking Recipes",
/* 03 */"Items",
/* 04 */"Item Effects",
/* 05 */"Maps",
/* 06 */"Models",
/* 07 */"NPCs/Actors",
/* 08 */"Pressure Plate Actions");

for (var i=0; i<ds_list_size(list); i++){
    draw_text(start_x+16, 48+16*i, list[| i]);
}

ds_list_destroy(list);

if (mouse_within_rectangle(start_x, 32, W-32, H/2+100)&&edit_database_overlay==Misc.edit_db_overlay_none){
    var my=min((MOUSE_Y-40) div 16, 3);
    draw_rectangle(start_x+8, 40+16*my, W-40, 56+16*my, true);
    switch (my){
        case 0:
            if (get_release_a()){
                edit_database_mode=Database.audio_groups;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_audio_groups;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 1:
            if (get_release_a()){
                edit_database_mode=Database.bgm;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_bgm;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 2:
            if (get_release_a()){
                edit_database_mode=Database.recipes;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_recipes;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 3:
            if (get_release_a()){
                edit_database_mode=Database.items;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_items;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 4:
            if (get_release_a()){
                edit_database_mode=Database.item_effects;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_item_effects;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 5:
            if (get_release_a()){
                edit_database_mode=Database.maps;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_maps;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 6:
            if (get_release_a()){
                edit_database_mode=Database.models;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_models;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 7:
            if (get_release_a()){
                edit_database_mode=Database.npcs;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_npcs;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
        case 8:
            if (get_release_a()){
                edit_database_mode=Database.pressure_plate_actions;
                var new_array=ds_map_find_value(all_mod_packages, edit_database_package).my_pressure_plate_actions;
                edit_database_active=min(edit_database_active, array_length_1d(new_array)-1);
                edit_database_start=clamp(edit_database_start, 0, max(array_length_1d(new_array)-1-edit_database_limit, 0));
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
            break;
    }
}
