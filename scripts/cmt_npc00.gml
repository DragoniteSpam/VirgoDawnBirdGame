var m=add_model_template("NPC", Models.extra_npc, "Represents a person you can walk around and interact with and talk to and whatever.", EntityNPC);
m.list[| 0].splitter=splitter_mtc_npc;
m.list[| 0].spawn_name="Generic Named NPC";
//m.list[| 0].spawn_cutscene_index[0]=Cutscenes.banter_technology01;

return m;
