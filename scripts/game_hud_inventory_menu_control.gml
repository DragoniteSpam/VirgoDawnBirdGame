/// void game_hud_inventory_menu_control(categories, display);

var categories=argument0;
var s=ds_list_size(argument1);
var xx=W/2+128;
var go_back=get_release_b();
var stack=argument1[| pause_item_reserve];
var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];

pause_minor_n=pause_cursor_handle(xx, 32, W*3/4, 84+20*s, pause_minor_n, 1);

switch (pause_minor_n){
    case 0: // use
        if (get_release_a()){
            item_use(base_item);
            if (base_item.consume_on_use){
                if (!RemoveItem(stack.package, stack.index, 1)){
                    pause_major_state=Pause.inventory_main;
                    pause_major_n=0;
                }
            }
        }
        break;
    case 1: // back
        if (get_release_a()){
            go_back=true;
        }
        break;
}

if (go_back){
    pause_major_state=Pause.inventory_display;
    pause_minor_n=pause_item_reserve;
    pause_cursor_set(W/4+32, 64, pause_minor_n);
}
