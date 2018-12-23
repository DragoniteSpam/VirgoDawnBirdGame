/// void Actor.AddItem(package, index, quantity);

if (argument1>0){
    var t=HasItem(argument0, argument1);
    if (t==noone){
        var n=instantiate(ItemStack);
        n.package=argument0;
        n.index=argument1;
        n.quantity=argument2;
        ds_list_add(Player.inventory, n);
    } else {
        t.quantity+=argument2;
        if (t.quantity<=0){
            RemoveItemStack(t);
        }
    }
}
