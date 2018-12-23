var n=array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_items);
var item=add_item("Item"+string(n+1), "Item "+string(n+1), "Items "+string(n+1), IPockets.GENERAL, 500, 1, 100, 0, ItemEffectCodes.NO, 1);
(ds_map_find_value(all_mod_packages, edit_database_package)).my_items[n]=item;

return item;
