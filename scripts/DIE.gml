/// boolean EntityNPC.DIE(killer, method);
// Returns true if dead.

if (!can_die){
    hp_active=1;
    return false;
}

if (id==Player.id){
    // Basically you drown and return to your last checkpoint
    with (Player){
        cutscene_index=get_cutscene_from_name("No Water Walking", 0);
        hp_current=max(floor(get_max_hp(exp_hp)/2), 1);
        stats_update_player_deaths(argument1);
        scr_cutscene_launch(cutscene_index);
    }
} else {
/*    x=0;
    y=0;
    z=-100;
    CollisionObjectTransform(id);*/

    var my_npc=ds_map_find_value(all_mod_packages, npc_package).my_npcs[npc_index];
    if (can_bleedout&!bleedout){
        scr_cutscene_launch(bleedout_cutscene);
        bleedout=true;
        hp_current=-1;
        if (my_npc.respawns){
            my_npc.respawn_now=true;
        }
    } else {
        //set_alive(false); // this is now handled in the On Death cutscene
        scr_cutscene_launch(death_cutscene);
        script_execute(all_death_scripts[on_death].code);
        if (my_npc.respawns){
            my_npc.respawn_now=false;
        }
        // this is for music    
        if (aggro_target==Player.id){
            aggro_target=noone;
            var aggroing=false;
            with (Entity){
                if (aggro_target!=noone){
                    aggroing=true;
                }
            }
            
            if (!aggroing){
                STOP_AUTO();
                PLAY_AUTO();
            }
        } else {
            aggro_target=noone; // this needs to be restated here, just in case
        }
        
        clear_attached_particles();
        
        if (argument0==Player.id){
            give_rewards();
        }
    }
    
    stats_update_foe_defeats();
}

return true;
