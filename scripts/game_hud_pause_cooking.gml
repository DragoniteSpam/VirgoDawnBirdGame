var window_buffer=32;
var box_buffer_width=96;
var box_buffer_height=20;

draw_rectangle_texture_auto(W/3-window_buffer, H/3-window_buffer, W*2/3+window_buffer, H*2/3+window_buffer, true);
draw_rectangle_texture_auto(W*5/12-box_buffer_width, H*5/12-box_buffer_height, W*5/12+box_buffer_width, H*5/12+box_buffer_height, true);
draw_rectangle_texture_auto(W*5/12-box_buffer_width, H*7/12-box_buffer_height, W*5/12+box_buffer_width, H*7/12+box_buffer_height, true);
draw_rectangle_texture_auto(W*7/12-box_buffer_width, H/2-box_buffer_height, W*7/12+box_buffer_width, H/2+box_buffer_height, true);
draw_set_colour(c_black);
draw_line(W*5/12+box_buffer_width, H*5/12, W*7/12-box_buffer_width-1, H/2);
draw_line(W*5/12+box_buffer_width, H*7/12, W*7/12-box_buffer_width-1, H/2);
draw_text(W*5/12, H*5/12-box_buffer_height-16, "Input A");
draw_text(W*5/12, H*7/12-box_buffer_height-16, "Input B");
draw_text(W*7/12, H/2-box_buffer_height-16, "Output");
draw_set_valign(fa_middle);
draw_text(W*5/12-96+16, H*5/12, ds_map_find_value(all_mod_packages, cooking_package[0]).my_items[cooking_input[0]].name);
draw_text(W*5/12-96+16, H*7/12, ds_map_find_value(all_mod_packages, cooking_package[1]).my_items[cooking_input[1]].name);

var output_recipe=0;
var output_package=BASE_ASSET;

for (var i=0; i<array_length_1d(all_mod_packages_array); i++){
    var package=all_mod_packages_array[i];
    for (var j=0; j<array_length_1d(package.my_recipes); j++){
        var recipe=package.my_recipes[j];
        if ((cooking_package[0]==recipe.package[0]||cooking_package[1]==recipe.package[0])&&
                (cooking_package[0]==recipe.package[1]||cooking_package[1]==recipe.package[1])){
            if ((cooking_input[0]==recipe.input[0]||cooking_input[1]==recipe.input[0])&&
                    (cooking_input[0]==recipe.input[1]||cooking_input[1]==recipe.input[1])){
                output_recipe=recipe.output;
                output_package=recipe.output_package;
                break;
            }
        }
    }
    // if you've found something, in other words
    if (output_recipe>0){
        break;
    }
}

draw_set_valign(fa_top);
if (cooking_input[0]>0){
    draw_hud_pause_cooking_box(W/3-window_buffer, window_buffer, W*2/3+window_buffer, H/3-window_buffer-window_buffer, cooking_package[0], cooking_input[0]);
}
if (cooking_input[1]>0){
    draw_hud_pause_cooking_box(W/3-window_buffer, H*2/3+window_buffer+window_buffer, W*2/3+window_buffer, H-window_buffer, cooking_package[1], cooking_input[1]);
}
if (output_recipe>0){
    draw_hud_pause_cooking_box(W*2/3+window_buffer+window_buffer, H/3+window_buffer, W-window_buffer, H*2/3-window_buffer, output_package, output_recipe);
    draw_set_valign(fa_middle);
    draw_text(W*7/12-96+16, H/2, ds_map_find_value(all_mod_packages, output_package).my_items[output_recipe].name);
    draw_set_valign(fa_top);
}

if (cooking_show_list){
    var list=pause_hud_item_populate_display_list(IPockets.COOKING);
    var limit=38;
    var len=ds_list_size(list);
    draw_rectangle_texture_auto(16, 16, W/3-window_buffer-16, 80+16*(min(len, limit)), true);
    draw_text(32, 32, "Ingredients");
    for (var i=cooking_list_offset; i<min(cooking_list_offset+limit, len); i++){
        draw_text(48, 48+16*(i-cooking_list_offset), ds_map_find_value(all_mod_packages, list[| i].package).my_items[list[| i].index].name);
        draw_text(W/3-128, 48+16*(i-cooking_list_offset), list[| i].quantity);
    }
    draw_text(48, 48+16*(i-cooking_list_offset), "Back");
    cooking_list_index=pause_cursor_handle(16, 16, W/4-16, 64+16*(min(len, limit)), cooking_list_index, min(limit, len), 32, 64, 16);
    if (Controller.release_b){
        cooking_show_list=false;
    }
    if (Controller.release_a){
        if (cooking_list_index==min(cooking_list_offset+limit, len)-1){
        } else {
            cooking_input[cooking_position]=list[| cooking_list_index].index;
        }
        cooking_show_list=false;
    }
} else {
    cooking_position=pause_cursor_handle(0, 0, W, H, cooking_position, 1, W*5/12-112, H*5/12, H/6);
    if (Controller.release_a){
        cooking_show_list=true;
        cooking_list_index=0;
        cooking_list_offset=0;
    }
    if (Controller.release_b){
        unpause_game();
    }
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (output_recipe>0){
    draw_input(Controller.gp_bind_x, Controller.mk_bind_x, W-120, H-160, "Cook");
    if (Controller.release_x){
        RemoveItem(cooking_package[0], cooking_input[0], 1);
        RemoveItem(cooking_package[1], cooking_input[1], 1);
        AddItem(output_package, output_recipe, 1);
        // @todo sound effect
        if (HasItem(cooking_package[0], cooking_input[0])==noone){
            cooking_input[0]=0;
            cooking_package[0]=BASE_ASSET;
        }
        if (HasItem(cooking_package[1], cooking_input[1])==noone){
            cooking_input[1]=0;
            cooking_package[1]=BASE_ASSET;
        }
    }
}
draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");
