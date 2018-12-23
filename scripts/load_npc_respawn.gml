/// load_npc_respawn(file);

load_npc(argument0);

if (ds_map_exists(argument0, "required_npc_package")){
    required_npc_package=argument0[? "required_npc_package"];
}
if (ds_map_exists(argument0, "required_npc")){
    required_npc=argument0[? "required_npc"];
}
