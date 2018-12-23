var categories=ds_list_create();

for (var i=0; i<ds_list_size(Player.inventory); i++){
    var stack=Player.inventory[| i];
    var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
    if (ds_list_find_index(categories, base_item.pocket)==-1){
        ds_list_add(categories, base_item.pocket);
    }
}

return categories;
