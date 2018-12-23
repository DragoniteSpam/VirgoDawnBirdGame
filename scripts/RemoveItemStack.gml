/// boolean RemoveItemStack(stack);

ds_list_delete(Player.inventory, HasItem(argument0.package, argument0.index));
instance_activate_object(argument0);
with (argument0){
    instance_destroy();
}
return true;
