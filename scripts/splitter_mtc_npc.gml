/// Entity splitter_mtc(component);
// Has to take the component parameter, can't use the with() structure,
// because this script still needs to be able to access x, y, z, etc.
with (splitter_mtc(argument0)){
    npc_index=NPCs.Nobody;
    image=NPCImages.Dragon;
    return id;
}
