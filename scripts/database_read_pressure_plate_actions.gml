#define database_read_pressure_plate_actions
/// database_read_pressure_plate_actions(ModPackage, map);

database_read_generic(argument0, argument1, 'ppa',
    database_get_pressure_plate_actions, database_set_pressure_plate_actions,
    database_read_pressure_plate_actions_thanks, get_pressure_plate_action_from_name, database_set_required_pressure_plate_actions);

#define database_read_pressure_plate_actions_thanks
/// Model database_read_models_thanks(base string, map);

with (instantiate(PressurePlateAction)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];

    on_trigger_package=argument1[? argument0+"on_trigger_package"];
    on_trigger=argument1[? argument0+"on_trigger"];
    on_release_package=argument1[? argument0+"on_release_package"];
    on_release=argument1[? argument0+"on_release"];
    
    return id;
}