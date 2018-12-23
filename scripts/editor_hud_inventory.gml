// header
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
var start_x=32;
var h=64;
var item_buffer=36;
draw_rectangle_colour(0, 0, W, H, c_white, c_white, c_white, c_white, false);
draw_rectangle_texture_auto(start_x, 32, W/2-32, h, true);
draw_set_color(graphics_text_color);

draw_text(start_x+16, 48, "Available Items");

var item_array=ds_map_find_value(all_mod_packages, edit_inventory_mod_package).my_items;

var start_y=h+32;
var width=W/2-32-start_x;
draw_rectangle_texture_auto(start_x, start_y, W/2-32, H-32, true);
for (var i=edit_item_scroll_index; i<min(edit_item_scroll_index+item_buffer, array_length_1d(item_array)); i++){
    draw_text(start_x+16, start_y+16+16*(i-edit_item_scroll_index), item_array[i].name);
}

if (mouse_within_rectangle(start_x, start_y, W/2-32, H-32)){
    var index=clamp((mouse_y-start_y-8) div 16, 0, array_length_1d(item_array)-1);
    draw_rectangle(start_x+4, start_y+16*index+16-8, W/2-32-16, start_y+16*index+16+8, true);
    draw_text(W/2-32-16-16*4, start_y+16+16*index, '+');
    draw_text(W/2-32-16-16*2, start_y+16+16*index, '-');
    if (mouse_within_rectangle(W/2-32-16-16*4, start_y+16+16*index-8, W/2-32-16-16*2, start_y+16+16*index+8)){
        draw_rectangle(W/2-32-16-16*4, start_y+16+16*index-8, W/2-32-16-16*2, start_y+16+16*index+8, true);
        if (get_release_a()){
            var q=get_integer('How many '+item_array[index+edit_item_scroll_index].plural+' to add?', 1);
            AddItem(edit_inventory_mod_package, index+edit_item_scroll_index, q);
        }
    } else if (mouse_within_rectangle(W/2-32-16-16*2, start_y+16+16*index-8, W/2-32-16, start_y+16+16*index+8)){
        draw_rectangle(W/2-32-16-16*2, start_y+16+16*index-8, W/2-32-16, start_y+16+16*index+8, true);
        if (get_release_a()){
            var q=get_integer('How many '+item_array[index+edit_item_scroll_index].plural+' to remove?', 1);
            RemoveItem(edit_inventory_mod_package, index+edit_item_scroll_index, q);
        }
    }
    if (mouse_wheel_up()){
        edit_item_scroll_index=max(0, --edit_item_scroll_index);
    } else if (mouse_wheel_down()){
        edit_item_scroll_index=min(array_length_1d(item_array)-1-item_buffer, ++edit_item_scroll_index);
    } else if (keyboard_check_released(vk_pageup)){
        edit_item_scroll_index=max(0, edit_item_scroll_index-item_buffer);
    } else if (keyboard_check_released(vk_pagedown)){
        edit_item_scroll_index=min(array_length_1d(item_array)-1-item_buffer, edit_item_scroll_index+item_buffer);
    } else if (keyboard_check_released(vk_end)){
        edit_item_scroll_index=array_length_1d(item_array)-1-item_buffer;
    } else if (keyboard_check_released(vk_home)){
        edit_item_scroll_index=0;
    }
}

var start_x=W/2;

draw_text(start_x+16, 48, "Player Inventory");

draw_rectangle_texture_auto(start_x, start_y, W-32, H-32, true);

if (ds_list_size(Player.inventory)>0){
    for (var i=edit_inventory_scroll_index; i<min(edit_inventory_scroll_index+item_buffer, ds_list_size(Player.inventory)); i++){
        draw_text(start_x+16, start_y+16+16*(i-edit_inventory_scroll_index), item_array[Player.inventory[| i].index].name+" x "+string(Player.inventory[| i].quantity));
    }
    
    if (mouse_within_rectangle(start_x, start_y, W-32, H-32)){
        var index=clamp((mouse_y-start_y-8) div 16, 0, ds_list_size(Player.inventory)-1);
        draw_rectangle(start_x+4, start_y+16*index+16-8, W-32-16, start_y+16*index+16+8, true);
        draw_text(W-32-16-16*4, start_y+16+16*index, '+');
        draw_text(W-32-16-16*2, start_y+16+16*index, '-');
        if (mouse_within_rectangle(W-32-16-16*4, start_y+16+16*index-8, W-32-16-16*2, start_y+16+16*index+8)){
            draw_rectangle(W-32-16-16*4, start_y+16+16*index-8, W-32-16-16*2, start_y+16+16*index+8, true);
            if (get_release_a()){
                show_message("This code probably doesn't work. If you actually need this code to work you should probably go in and fix it.");
/*                var q=get_integer('How many '+item_array[index+edit_inventory_scroll_index].plural+' to add?', 1);
                AddItem(edit_inventory_mod_package, index+edit_inventory_scroll_index, q);*/
            }
        } else if (mouse_within_rectangle(W-32-16-16*2, start_y+16+16*index-8, W-32-16, start_y+16+16*index+8)){
            draw_rectangle(W-32-16-16*2, start_y+16+16*index-8, W-32-16, start_y+16+16*index+8, true);
            if (get_release_a()){
                show_message("This code probably doesn't work. If you actually need this code to work you should probably go in and fix it.");
/*                var q=get_integer('How many '+item_array[index+edit_inventory_scroll_index].plural+' to remove?', 1);
                RemoveItem(edit_inventory_mod_package, index+edit_inventory_scroll_index, q);*/
            }
        }
        if (mouse_wheel_up()){
            edit_inventory_scroll_index=max(0, --edit_inventory_scroll_index);
        } else if (mouse_wheel_down()){
            edit_inventory_scroll_index=min(ds_list_size(Player.inventory)-1-item_buffer, ++edit_inventory_scroll_index);
        } else if (keyboard_check_released(vk_pageup)){
            edit_inventory_scroll_index=max(0, edit_inventory_scroll_index-item_buffer);
        } else if (keyboard_check_released(vk_pagedown)){
            edit_inventory_scroll_index=min(ds_list_size(Player.inventory)-1-item_buffer, edit_inventory_scroll_index+item_buffer);
        } else if (keyboard_check_released(vk_end)){
            edit_inventory_scroll_index=ds_list_size(Player.inventory)-1-item_buffer;
        } else if (keyboard_check_released(vk_home)){
            edit_inventory_scroll_index=0;
        }
    }
} else {
    draw_text(start_x+16, start_y+16, "Player has no items on hand.");
}
