/// void load_entity(file);

load_principle(argument0);

model=argument0[? "model"];
model_index=argument0[? "model_index"];
set_alive(argument0[? "alive"], COLLISION_EVENT_DEFAULT);

model=World.mdl_npc;
model_index=0;

script_execute(collision_adder, id);
