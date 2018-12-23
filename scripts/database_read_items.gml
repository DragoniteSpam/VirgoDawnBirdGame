#define database_read_items
/// error code database_read_items(ModPackage, map);

return database_read_generic(argument0, argument1, 'item',
    database_get_items, database_set_items,
    database_read_items_thanks, get_item_from_name, database_set_required_items);

#define database_read_items_thanks
/// Item database_read_items_thanks(base string, map);

with (instantiate(Item)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    
    index=argument1[? argument0+"index"];
    plural=argument1[? argument0+"plural"];
    pocket=argument1[? argument0+"pocket"];
    value=argument1[? argument0+"value"];
    tmin=argument1[? argument0+"tmin"];
    tmax=argument1[? argument0+"tmax"];
    item_effect=argument1[? argument0+"item_effect"];
    item_power=argument1[? argument0+"item_power"];
    weapon_graphic=argument1[? argument0+"weapon_graphic"];
    weapon_effect=argument1[? argument0+"weapon_effect"];
    consume_on_use=argument1[? argument0+"consume_on_use"];
    autofire=argument1[? argument0+"autofire"];
    weapon_anim_steps=argument1[? argument0+"weapon_anim_steps"];
    
    // forgot to include these the first time lol
    if (ds_map_exists(argument1, argument0+"model_package")){
        model_package=argument1[? argument0+"model_package"];
    }
    if (ds_map_exists(argument1, argument0+"model")){
        model=argument1[? argument0+"model"];
    }
    if (ds_map_exists(argument1, argument0+"item_effect_package")){
        item_effect_package=argument1[? argument0+"item_effect_package"];
    }
    
    return id;
}