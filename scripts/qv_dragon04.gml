/// boolean qv_dragon04(Entity, param);

var param=argument1;

// Invalid param
if (abs(param)>0){
    return false;
}

if (instance_exists(argument0)){
    if (argument0.npc_index==NPCs.NPCDragonDragon){
        return true;
    }
}

return false;
