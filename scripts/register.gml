/// void register(Entity, npc package, npc index);

var arr=(ds_map_find_value(all_mod_packages, argument1)).my_npcs;

arr[argument2].actor=argument0;

World.entities[? arr[argument1].name]=argument0;
