/// ItemEffect add_item_effect(name, script);

with (instantiate(ItemEffect)){
    name=argument[0];
    script=argument[1];
    return id;
}
