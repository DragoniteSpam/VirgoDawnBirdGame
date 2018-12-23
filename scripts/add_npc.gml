/// Item add_npc(internal name, name, [respawns]);

with (instantiate(NPC)){
    internal_name=argument[0];
    // this relies on the fact that switch statements do not break
    // unless specifically told to (so don't add breaks)
    switch (argument_count){
        default:
        case 3:
            respawns=argument[2];
        case 2:
            name=argument[1];
            break;
    }
    
    return id;
}
