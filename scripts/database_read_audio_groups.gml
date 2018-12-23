#define database_read_audio_groups
/// error code database_read_items(ModPackage, map);

return database_read_generic(argument0, argument1, 'ag',
    database_get_audio_groups, database_set_audio_groups,
    database_read_audio_groups_thanks, get_audio_group_from_name, database_set_required_audio_groups);

#define database_read_audio_groups_thanks
/// AudioGroup database_read_audio_groups_thanks(base string, map);

with (instantiate(AudioGroup)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    
    ds_list_read(packages, argument1[? argument0+"packages"]);
    ds_list_read(songs, argument1[? argument0+"songs"]);
    ds_list_read(packages_ambient, argument1[? argument0+"packages_ambient"]);
    ds_list_read(ambient, argument1[? argument0+"ambient"]);
    
    return id;
}