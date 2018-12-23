var result=Items.NONE;
while (all_items[result].pocket==IPockets.KEY||all_items[result]==noone){
    result=irandom(array_length_1d(all_items)-1);
}

return result;
