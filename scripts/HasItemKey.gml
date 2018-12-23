/// ItemStack HasItemKey(flag);

for (var i=0; i<ds_list_size(Player.inventory); i++){
    if (all_items[Player.inventory[| i].index].door_flag==argument0)
        return Player.inventory[| i];
}

return noone;
