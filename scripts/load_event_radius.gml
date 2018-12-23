/// void load_event_radius(file);

load_principle(argument0);

model=argument0[? "model"];
model_index=argument0[? "model_index"];
set_alive(argument0[? "alive"]);
radius=argument0[? "radius"];

model=World.mdl_npc;
model_index=0;

script_execute(collision_adder, id);
