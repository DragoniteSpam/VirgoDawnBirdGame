var m=add_model_template("NPC (Walls)", Models.extra_npc, "Represents an NPC who can be attached to a wall, fall upon hit and be stunned for a few seconds before getting back up.", EntityNPCWalls);
m.list[| 0].splitter=splitter_mtc_npc;
m.list[| 0].spawn_name="Generic Named Wall NPC";
//m.list[| 0].spawn_cutscene_index[0]=Cutscenes.banter_technology01;

return m;
