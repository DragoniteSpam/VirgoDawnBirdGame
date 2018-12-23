/// void can_fast_travel();

for (var i=0; i<instance_number(EntityNPC); i++){
    var ent=instance_find(EntityNPC, i);
    if (ent.alive&&ent.aggro_target==Player.id){
        return false;
    }
}

return true;
