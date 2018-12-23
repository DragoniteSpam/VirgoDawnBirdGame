var base_npc=ds_map_find_value(all_mod_packages, required_npc_package).my_npcs[required_npc];
if (base_npc.respawns){
    set_alive(base_npc.respawn_now);
}
