/// int HasItemIndex(index);

for (var i=0; i<ds_list_size(Player.inventory); i++){
    if (Player.inventory[| i].index==argument0)
        return i;
}

return noone;
