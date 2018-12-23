var q=instantiate(Quest, argument1);
q.internal_name=argument0;
q.description=argument2;
q.quest_id=argument3;
ds_list_add(q.stages, add_quest_stage("Uncompletable", 100, BASE_ASSET, NPCs.Nobody, qv_stub, "No completion trigger."));

return q;
