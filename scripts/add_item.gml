/// Item add_item(internal name, name, plural, pocket, value, level min, level max, sprite, item effect code, item power, [description], [weapon effect, weapon graphic], [consume on use], [weapon autofire], [weapon anim steps], [weapon model]);

with (instantiate(Item)){
    internal_name=argument[0];
    name=argument[1];
    plural=argument[2];
    pocket=argument[3];
    value=argument[4];
    tmin=argument[5];
    tmax=argument[6];
    image_index=argument[7];
    item_effect=argument[8];
    item_power=argument[9];
    
    summary=argument[2];
    switch (argument_count){
        case 17:
            model=argument[16];
        case 16:
            weapon_anim_steps=argument[15];
        case 15:
            autofire=argument[14];
        case 14:
            consume_on_use=argument[13];
        case 13:
            weapon_effect=argument[11];
            weapon_graphic=argument[12];
        case 11:
            summary=argument[10];
            break;
    }
    
    return id;
}
