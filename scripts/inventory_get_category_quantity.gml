/// int inventory_get_category_quantity(IPocket);
// Returns the number of items in ____ category.

var n=0;

for (var i=0; i<ds_list_size(Player.inventory); i++){
    var item=Player.inventory[| i];
    var base_item=ds_map_find_value(all_mod_packages, item.package).my_items[item.index];
    n=n+(base_item.pocket==argument0); // code golf
}

return n;
