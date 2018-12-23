/// boolean qv_mq02_01(Entity, param);

var param=argument1;

// Invalid param
if (abs(param)>0){
    return false;
}

if (instance_exists(argument0)){
    if (argument0.npc_index==NPCs.BookMQPoacherJournal){
        return true;
    }
}
return false;
