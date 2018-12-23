/// load_cauldron_k(file);

load_entity(argument0);

loot_random=argument0[? "loot_random"];
loot=argument0[? "loot"];
loot_quantity=argument0[? "loot_quantity"];

if (ds_map_exists(argument0, "lock_index")){
    lock_index=argument0[? "lock_index"];
}
