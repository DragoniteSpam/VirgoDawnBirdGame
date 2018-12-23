/// boolean qv_fetch02(Entity, param);

var param=argument1;

// Invalid param
if (abs(param)>0){
    return false;
}

if (instance_exists(argument0)){
    if (argument0.npc_index==NPCs.NPCFetchHenrietta){
        return true;
    }
}

return false;
