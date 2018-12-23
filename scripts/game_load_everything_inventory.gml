/// void game_load_everything_inventory(map);

with (Player){
    var n_items=argument0[? "__inv_size"];
    while (ds_list_size(inventory)>0){
        RemoveItemStack(inventory[| 0]);
    }
    
    for (var i=0; i<n_items; i++){
        var item=instantiate(ItemStack);
        item.package=argument0[? "__inv_"+string(i)+"_package"];
        item.index=argument0[? "__inv_"+string(i)+"_id"];
        item.quantity=argument0[? "__inv_"+string(i)+"_quantity"];
        ds_list_add(inventory, item);
    }
}
