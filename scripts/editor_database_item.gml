var start_x=W/4+64;
var start_y=64;
var end_x=W*3/4-64;
var end_y=start_y+352;

var item=ds_map_find_value(all_mod_packages, edit_database_package).my_items[edit_database_active];

draw_text(start_x, start_y, "Internal Name: "+item.internal_name);
draw_text(start_x, start_y+16, "Name: "+item.name);
draw_text(start_x, start_y+32, "Plural: "+item.plural);
var suffix=ternary(string_length(item.summary)>36, "...", "")
draw_text(start_x, start_y+48, "Summary: "+string_copy(item.summary, 1, 36)+suffix);

draw_text(start_x, start_y+80, "Value: "+string(item.value));
draw_text(start_x, start_y+96, "Pocket: "+item_pocket[item.pocket].name);
draw_text(start_x, start_y+112, "Spawn Min: "+string(item.tmin));
draw_text(start_x, start_y+128, "Spawn Max: "+string(item.tmax));
draw_text(start_x, start_y+144, "Item Power: "+string(item.item_power));
draw_text(start_x, start_y+160, "Item Effect Package: "+item.item_effect_package);
draw_text(start_x, start_y+176, "Item Effect: "+ds_map_find_value(all_mod_packages, item.item_effect_package).my_item_effects[item.item_effect].name);
draw_text(start_x, start_y+192, "(this was used for something but i removed it)");
var c=rg[item.consume_on_use];
draw_text_colour(start_x, start_y+208, "Consume On Use: "+tf[item.consume_on_use], c, c, c, c, 1);
var c=rg[item.autofire];
draw_text_colour(start_x, start_y+224, "Autofire: "+tf[item.autofire], c, c, c, c, 1);
draw_text(start_x, start_y+256, "Weapon Animation Frames: "+string(item.weapon_anim_steps));

draw_text(start_x, start_y+272, "Equip Graphic: "+all_weapon_graphics[item.weapon_graphic].name);
draw_text(start_x, start_y+288, "Equip Effect: "+all_weapon_effects[item.weapon_effect].name);

draw_text(start_x, start_y+320, "3D Model Package: "+item.model_package);
draw_text(start_x, start_y+336, "3D Model: "+ds_map_find_value(all_mod_packages, item.mod_package).my_models[item.model].name);
draw_text(start_x, start_y+352, "Icon: "+string(item.index));
draw_sprite_ext(spr_item, item.index, start_x, start_y+368, 2, 2, 0, c_white, 1);

switch (edit_database_overlay){
    case Misc.edit_db_overlay_none:
        if (mouse_within_rectangle(start_x, start_y, end_x, end_y)){
            var n=clamp((MOUSE_Y-(start_y-8)) div 16, 0, 22);
            draw_rectangle(start_x-8, start_y-8+16*n, end_x-8, start_y+8+16*n, true);
            switch (n){
                case 0:
                    if (get_release_a()){
                        item.internal_name=string_lettersdigits(get_string("The name that the game will refer to the item as internally? (Must be only letters or digits.)", item.internal_name));
                    }
                    break;
                case 1:
                    if (get_release_a()){
                        item.name=get_string("The name for the item that the players will see?", item.name);
                    }
                    break;
                case 2:
                    if (get_release_a()){
                        item.plural=get_string("The name for the item that the players will see when there are more than one of them?", item.plural);
                    }
                    break;
                case 3:
                    if (get_release_a()){
                        item.summary=get_string("The description for the item that the players will see in the inventory?", item.summary);
                    }
                    break;
                // 4 is skipped
                case 5:
                    if (get_release_a()){
                        item.value=clamp(get_integer("How much you get for this item when selling it at a shop? (0 means it can't be sold)", item.value), 0, SHORT-1);
                    }
                    if (Controller.press_left){
                        item.value=(++item.value)%SHORT;
                    } else if (Controller.press_right){
                        item.value=(--item.value+SHORT)%SHORT;
                    } else if (Controller.press_up){
                        item.value=(item.value+10)%SHORT;
                    } else if (Controller.press_down){
                        item.value=(item.value-10+SHORT)%SHORT;
                    }
                    break;
                case 6:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_item_pocket;
                    }
                    var n=array_length_1d(item_pocket);
                    if (Controller.press_left){
                        item.pocket=(++item.pocket)%n;
                    } else if (Controller.press_right){
                        item.pocket=(--item.pocket+n)%n;
                    }
                    break;
                case 7:
                    if (get_release_a()){
                        item.tmin=clamp(get_integer("The minimum level the player must be to encounter this item as random loot.", item.tmin), 0, BYTE-1);
                    }
                    if (Controller.press_left){
                        item.tmin=(++item.tmin)%BYTE;
                    } else if (Controller.press_right){
                        item.tmin=(--item.tmin+BYTE)%BYTE;
                    } else if (Controller.press_up){
                        item.tmin=(item.tmin+10)%BYTE;
                    } else if (Controller.press_down){
                        item.tmin=(item.tmin-10+BYTE)%BYTE;
                    }
                    break;
                case 8:
                    if (get_release_a()){
                        item.tmax=clamp(get_integer("The maximum level the player may be to encounter this item as random loot (0 to disable)", item.tmax), 0, BYTE-1);
                    }
                    if (Controller.press_left){
                        item.tmax=(++item.tmax)%BYTE;
                    } else if (Controller.press_right){
                        item.tmax=(--item.tmax+BYTE)%BYTE;
                    } else if (Controller.press_up){
                        item.tmax=(item.tmax+10)%BYTE;
                    } else if (Controller.press_down){
                        item.tmax=(item.tmax-10+BYTE)%BYTE;
                    }
                    break;
                case 9:
                    if (get_release_a()){
                        item.item_power=clamp(get_integer("The maximum level the player may be to encounter this item as random loot (0 to disable)", item.item_power), 0, MILLION);
                    }
                    if (Controller.left){
                        item.item_power=(item.item_power+0.01)%MILLION;
                    } else if (Controller.right){
                        item.item_power=(item.item_power-0.01+MILLION)%MILLION;
                    } else if (Controller.press_up){
                        item.item_power=(item.item_power+10)%MILLION;
                    } else if (Controller.press_down){
                        item.item_power=(item.item_power-10+MILLION)%MILLION;
                    }
                    break;
                case 10:
                    if (get_release_a()){
                        var name=get_mod_package_from_name(get_string("New mod package that the item's 3D model can be found in?", item.item_effect_package), item.item_effect_package);
                        if (name!=item.item_effect_package){
                            item.item_effect=0;
                        }
                        item.item_effect_package=name;
                    }
                    break;
                case 11:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_item_effect;
                    }
                    var n=array_length_1d(ds_map_find_value(all_mod_packages, item.item_effect_package).my_item_effects);
                    if (Controller.press_left){
                        item.item_effect=(++item.item_effect)%n;
                    } else if (Controller.press_right){
                        item.item_effect=(--item.item_effect+n)%n;
                    }
                    break;
                case 12:
                    if (get_release_a()){
                        show_message("don't mind this");
                    }
                    break;
                case 13:
                    if (get_release_a()){
                        item.consume_on_use=!item.consume_on_use;
                    }
                    break;
                case 14:
                    if (get_release_a()){
                        item.autofire=!item.autofire;
                    }
                    break;
                case 15:
                    if (get_release_a()){
                        item.weapon_anim_steps=get_integer("The number of frames of animation this item's 'swing' animation takes up?", item.weapon_anim_steps);
                    }
                    if (Controller.press_left){
                        item.weapon_anim_steps=(++item.weapon_anim_steps)%BYTE;
                    } else if (Controller.press_right){
                        item.weapon_anim_steps=(--item.weapon_anim_steps+BYTE)%BYTE;
                    } else if (Controller.press_up){
                        item.weapon_anim_steps=(item.weapon_anim_steps+10)%BYTE;
                    } else if (Controller.press_down){
                        item.weapon_anim_steps=(item.weapon_anim_steps-10+BYTE)%BYTE;
                    }
                    break;
                // 16 is skipped
                case 17:
                    if (get_release_a()){
                        //item.weapon_graphic=get_weapon_graphic_from_name(get_string("The visual for this item when it's equipped?", all_weapon_graphics[item.weapon_graphic].name), item.weapon_graphic);
                        edit_database_overlay=Misc.edit_db_overlay_item_equip_graphic;
                    }
                    var n=array_length_1d(all_weapon_graphics);
                    if (Controller.press_left){
                        item.weapon_graphic=(++item.weapon_graphic)%n;
                    } else if (Controller.press_right){
                        item.weapon_graphic=(--item.weapon_graphic+n)%n;
                    }
                    break;
                case 18:
                    if (get_release_a()){
                        //item.weapon_effect=get_weapon_effect_from_name(get_string("The effect the item will have when used when it's equipped?", all_weapon_effects[item.weapon_effect].name), item.weapon_effect);
                        edit_database_overlay=Misc.edit_db_overlay_item_equip_effect;
                    }
                    var n=array_length_1d(all_weapon_effects);
                    if (Controller.press_left){
                        item.weapon_effect=(++item.weapon_effect)%n;
                    } else if (Controller.press_right){
                        item.weapon_effect=(--item.weapon_effect+n)%n;
                    }
                    break;
                // 19 is skipped
                case 20:
                    if (get_release_a()){
                        var name=get_mod_package_from_name(get_string("New mod package that the item's 3D model can be found in?", item.model_package), item.model_package);
                        if (name!=item.model_package){
                            item.model=0;
                        }
                        item.model_package=name;
                    }
                    break;
                case 21:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_item_model;
                    }
                    break;
                case 22:
                    if (get_release_a()){
                        edit_database_overlay=Misc.edit_db_overlay_item_icon;
                    }
                    break;
            }
        }
        break;
    case Misc.edit_db_overlay_item_icon:
        start_x=W/4+128;
        start_y=128;
        end_x=W*3/4-128;
        end_y=H-128;
        var icon_width=sprite_get_width(spr_item);
        var icon_height=sprite_get_height(spr_item);
        draw_rectangle_texture_auto(start_x, start_y, end_x, end_y, true);
        draw_text(start_x+32, start_y+32, "Pick an icon:");
        draw_sprite_ext(spr_x_8, 0, end_x-32, start_y+32, 2, 2, 0, c_red, 1);
        var num_columns=((end_x-start_x)-64) div icon_width;
        var num_rows=((end_y-start_y)-64) div icon_height;
        for (var i=edit_database_overlay_item_icon_start; i<min(sprite_get_number(spr_item), edit_database_overlay_item_icon_start+num_columns*num_rows); i++){
            var xx=start_x+32+(i%num_columns)*icon_width;
            var yy=start_y+64+((i-edit_database_overlay_item_icon_start) div num_columns)*icon_height;
            draw_sprite(spr_item, i, xx, yy);
        }
        if (mouse_within_rectangle(end_x-32-sprite_get_width(spr_x_8)*2, start_y+32-sprite_get_height(spr_x_8)*2, end_x-32+sprite_get_width(spr_x_8)*2, start_y+32+sprite_get_height(spr_x_8)*2)){
            draw_rectangle(end_x-32-sprite_get_width(spr_x_8)*2, start_y+32-sprite_get_height(spr_x_8)*2, end_x-32+sprite_get_width(spr_x_8)*2, start_y+32+sprite_get_height(spr_x_8)*2, true);
            if (get_release_a()){
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
        }
        if (mouse_within_rectangle(start_x+32, start_y+64, start_x+32+num_columns*icon_width, start_y+64+num_rows*icon_height)){
            var icon_final=((sprite_get_number(spr_item)-1) div num_columns)*num_columns;
            if (mouse_wheel_up()){
                edit_database_overlay_item_icon_start=max(0, edit_database_overlay_item_icon_start-num_columns);
            } else if (mouse_wheel_down()){
                edit_database_overlay_item_icon_start=min(icon_final, edit_database_overlay_item_icon_start+num_columns);
            } else if (keyboard_check_released(vk_pageup)){
                edit_database_overlay_item_icon_start=max(0, edit_database_overlay_item_icon_start-num_columns*5);
            } else if (keyboard_check_released(vk_pagedown)){
                edit_database_overlay_item_icon_start=min(icon_final, edit_database_overlay_item_icon_start+num_columns*5);
            } else if (keyboard_check_released(vk_home)){
                edit_database_overlay_item_icon_start=0;
            } else if (keyboard_check_released(vk_end)){
                edit_database_overlay_item_icon_start=icon_final;
            }
            
            var grid_x=clamp((MOUSE_X-start_x-32) div icon_width, 0, num_columns-1);
            var grid_y=clamp((MOUSE_Y-start_y-64) div icon_height, 0, num_rows-1);
            
            draw_rectangle_colour(start_x+32+grid_x*icon_width, start_y+64+grid_y*icon_height, start_x+32+(grid_x+1)*icon_width-1, start_y+64+(grid_y+1)*icon_height-1, c_blue, c_blue, c_blue, c_blue, true);
            
            if (get_release_a()){
                item.index=min(edit_database_overlay_item_icon_start+grid_x+grid_y*num_columns, sprite_get_number(spr_item)-1);
                edit_database_overlay=Misc.edit_db_overlay_none;
            }
        }
        break;
    case Misc.edit_db_overlay_item_equip_effect:
        if (editor_hud_database_resource_select(item,
                "Pick an equip effect: ",
                editor_hud_database_resource_item_equip_effect_list,
                editor_hud_database_resource_item_equip_effect_name,
                editor_hud_database_resource_item_equip_effect_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_item_equip_graphic:
        if (editor_hud_database_resource_select(item,
                "Pick an equip graphic: ",
                editor_hud_database_resource_item_equip_graphic_list,
                editor_hud_database_resource_item_equip_graphic_name,
                editor_hud_database_resource_item_equip_graphic_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_item_effect:
        if (editor_hud_database_resource_select(item,
                "Pick an item effect: ",
                editor_hud_database_resource_item_effect_list,
                editor_hud_database_resource_item_effect_name,
                editor_hud_database_resource_item_effect_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_item_pocket:
        if (editor_hud_database_resource_select(item,
                "Pick an item pocket: ",
                editor_hud_database_resource_item_pocket_list,
                editor_hud_database_resource_item_pocket_name,
                editor_hud_database_resource_item_pocket_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
    case Misc.edit_db_overlay_item_model:
        if (editor_hud_database_resource_select(item,
                "Pick an item pocket: ",
                editor_hud_database_resource_item_model_list,
                editor_hud_database_resource_item_model_name,
                editor_hud_database_resource_item_model_set)){
            edit_database_overlay=Misc.edit_db_overlay_none;
        }
        break;
}
