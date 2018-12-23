/// ItemStack HasItem(package, index);

for (var i=0; i<ds_list_size(Player.inventory); i++){
    if (Player.inventory[| i].package==argument0&&Player.inventory[| i].index==argument1)
        return Player.inventory[| i];
}

return noone;
