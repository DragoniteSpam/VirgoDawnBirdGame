/// void game_hud_inventory_display_control(categories, display);

var categories=argument0;
var s=ds_list_size(argument1);
var xx=W/4+8
pause_minor_n=min(ds_list_size(argument1), pause_minor_n);  // don't go -1 because the last index is "back"

pause_minor_n=pause_cursor_handle(xx, 32, W/2, 84+20*s, pause_minor_n, s);
var go_back=get_release_b();

if (pause_minor_n==s){
    if (get_release_a()){
        go_back=true;
    }
} else {
    var stack=argument1[| pause_minor_n];
    var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
    if (get_release_a()){
/*        pause_major_state=Pause.inventory_menu;
        pause_item_reserve=pause_minor_n;
        pause_minor_n=0;*/
        
        item_use(base_item);
        if (base_item.consume_on_use){
            if (!RemoveItem(stack.package, stack.index, 1)){
                pause_major_state=Pause.inventory_main;
                pause_major_n=0;
            }
        }
    } else if (get_release_x()){
        pause_major_state=Pause.inventory_focus;
    }
}
if (go_back){
    pause_major_state=Pause.inventory_main;
    pause_cursor_set(56, 84, pause_major_n);
}
