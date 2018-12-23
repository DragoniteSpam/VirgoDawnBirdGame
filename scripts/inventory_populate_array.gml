/// array inventory_populate_array(IPocket, include 0 at 0?);
// Returns an array full of all of the items in an IPocket.
// There is a "default" value stored in the beginning

var size=inventory_get_category_quantity(argument[0]);
var array=array_add(size);

var n=0;

// this is mainly so i can play code golf with hud_bestiary
if (argument_count>1&&argument[0]){
    array[n++]=0;
}

for (var i=0; i<ds_list_size(Player.inventory); i++){
    var stack=Player.inventory[| i];
    var base_item=ds_map_find_value(all_mod_packages, stack.package).my_items[stack.index];
    if (base_item.pocket==argument[0]){
        array[n++]=base_item;   // remember what the postfix increment operator does
    }
}

return array;
