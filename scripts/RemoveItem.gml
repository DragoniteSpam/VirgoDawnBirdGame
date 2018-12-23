/// boolean RemoveItem(package, index, quantity);

// Return true if there are any items left, false otherwise

var t=HasItem(argument0, argument2);

if (t==noone){
    return false;
}

t.quantity-=argument1;
if (t.quantity<=0){
    RemoveItemStack(t);
    return false;
}

return true;
