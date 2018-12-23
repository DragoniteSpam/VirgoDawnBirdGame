var m=add_model_template("NPC (Respawn)", Models.extra_npc, "Represents an NPC who appears after you've defeated (but not killed) a foe.", EntityNPCRespawn);
m.list[| 0].splitter=splitter_mtc_npc;
m.list[| 0].spawn_name="Generic Named Respawn NPC";
//m.list[| 0].spawn_cutscene_index[0]=Cutscenes.banter_technology01;

return m;
