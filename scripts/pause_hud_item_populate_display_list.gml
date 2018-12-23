/// list pause_hud_item_populate_display_list(category);

var display=ds_list_create();

for (var i=0; i<ds_list_size(Player.inventory); i++){
    var stack=Player.inventory[| i];
    if (ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index].pocket==argument0){
        ds_list_add(display, stack);
    }
}

return display;
