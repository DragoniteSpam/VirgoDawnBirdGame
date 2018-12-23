#define database_read_npc
/// database_read_bgm(ModPackage, map);

database_read_generic(argument0, argument1, 'npc',
    database_get_npc, database_set_npc,
    database_read_npc_thanks, get_npc_from_name, database_set_required_npc);

#define database_read_npc_thanks
with (instantiate(NPC)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    
    respawns=argument1[? argument0+"respawns"];
    
    return id;
}