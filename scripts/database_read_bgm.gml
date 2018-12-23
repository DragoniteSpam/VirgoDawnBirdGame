#define database_read_bgm
/// database_read_bgm(ModPackage, map);

database_read_generic(argument0, argument1, 'bgm',
    database_get_bgm, database_set_bgm,
    database_read_bgm_thanks, get_bgm_from_name, database_set_required_bgm);

#define database_read_bgm_thanks
with (instantiate(BackgroundMusic)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    
    internal_song=argument1[? argument0+"internal_song"];
    path=argument1[? argument0+"path"];
    if (internal_song){
        song=asset_get_index(argument1[? argument0+"song"]);
    } else {
        loaded=audio_create_stream(MOD_DIRECTORY+'\'+path);
        song=loaded;
    }
    author=argument1[? argument0+"author"];
    
    return id;
}