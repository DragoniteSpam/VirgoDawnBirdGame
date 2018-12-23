/// void game_save_everything_inventory(map);

with (Player){
    var n_items=ds_list_size(inventory);
    ds_map_add(argument0, "__inv_size", n_items);
    
    for (var i=0; i<n_items; i++){
        var item=inventory[| i];
        ds_map_add(argument0, "__inv_"+string(i)+"_package", item.package);
        ds_map_add(argument0, "__inv_"+string(i)+"_id", item.index);
        ds_map_add(argument0, "__inv_"+string(i)+"_quantity", item.quantity);
    }
}
