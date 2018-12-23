var n=array_length_1d(ds_map_find_value(all_mod_packages, edit_database_package).my_npcs);
var npc=add_npc("NPC"+string(n+1), "NPC "+string(n+1));
(ds_map_find_value(all_mod_packages, edit_database_package)).my_npcs[n]=npc;

return npc;
