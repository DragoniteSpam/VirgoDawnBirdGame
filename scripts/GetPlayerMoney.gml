var stack=HasItem(BASE_ASSET, World.it_money);
if (stack==noone){
    return 0;
} else {
    return stack.quantity;
}
