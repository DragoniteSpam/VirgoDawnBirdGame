#define database_read_item_effects
/// database_read_item_effects(ModPackage, map);

database_read_generic(argument0, argument1, 'ie',
    database_get_item_effect, database_set_item_effect,
    database_read_item_effect_thanks, get_item_effect_from_name, database_set_required_item_effect);

#define database_read_item_effect_thanks
with (instantiate(ItemEffect)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    
    scritp_package=argument1[? argument0+"script_package"];
    script=argument1[? argument0+"script"];
    
    return id;
}