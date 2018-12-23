/// String data_script_npc_respawn(object);

var xref=W-320;

draw_rectangle_texture_auto_box(xref+160, 32, "NPC Respawn", argument0.editor_state==Editor.npc_respawn, argument0, Editor.npc_respawn);

data_script_npc(argument0);

if (argument0.editor_state==Editor.npc_respawn){
    draw_text(xref+16, 80, "Required NPC Package: "+argument0.required_npc_package);
    draw_text(xref+16, 96, "Required NPC: "+ds_map_find_value(all_mod_packages, argument0.required_npc_package).my_npcs[argument0.required_npc].name);
    var c=rg[argument0.alive];
    draw_text_colour(xref+16, 96, "Alive: "+tf[argument0.alive], c, c, c, c, 1);

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 2);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the registered NPC can be found in? (If you change this the NPC will be reset.)", argument0.required_npc_package), argument0.required_npc_package);
                    if (argument0.required_npc_package!=lp){
                        argument0.required_npc=0;
                    }
                    argument0.required_pc_package=lp;
                }
                break;
            case 1:
                if (get_release_a()){
                    var str=get_string("NPC required to be defeated in order for this NPC to spawn?", ds_map_find_value(all_mod_packages, argument0.required_npc_package).my_npcs[argument0.required_npc].name);
                    argument0.required_npc=get_npc_from_name(argument0.required_npc_package, str, argument0.required_npc);
                }
                break;
            case 2:
                if (get_release_a()){
                    with (argument0){
                        set_alive(!alive);
                    }
                }
                break;
        }
    }
}
