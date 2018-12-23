var start_x=W/4+64;
var start_y=64;
var end_x=W*3/4-64;
var end_y=H-64;

var npc=ds_map_find_value(all_mod_packages, edit_database_package).my_npcs[edit_database_active];

draw_text(start_x, start_y, "Internal Name: "+npc.internal_name);
draw_text(start_x, start_y+16, "Name: "+npc.name);
var suffix=ternary(string_length(npc.summary)>36, "...", "")
draw_text(start_x, start_y+32, "Summary: "+string_copy(npc.summary, 1, 36)+suffix);

var c=rg[npc.respawns];
draw_text_colour(start_x, start_y+64, "Respawns? "+tf[npc.respawns], c, c, c, c, 1);
var who_string='';
if (npc.actor==noone){
    who_string="N/A";
} else if (!instance_exists(npc.actor)){
    who_string="<not in this map>";
} else {
    who_string=npc.actor.name+" ("+string(npc.actor.id)+") @ "+string(npc.actor.x)+", "+string(npc.actor.y)+", "+string(npc.actor.z);
}
draw_text_colour(start_x, start_y+80, "Assigned Entity: "+who_string, c_blue, c_blue, c_blue, c_blue, 1);

switch (edit_database_overlay){
    case Misc.edit_db_overlay_none:
        if (mouse_within_rectangle(start_x, start_y, end_x, start_y+232)){
            var n=clamp((MOUSE_Y-(start_y-8)) div 16, 0, 5);
            draw_rectangle(start_x-8, start_y-8+16*n, end_x-8, start_y+8+16*n, true);
            switch (n){
                case 0:
                    if (get_release_a()){
                        npc.internal_name=string_lettersdigits(get_string("The name that the game will refer to the NPC as internally? (Must be only letters or digits.)", npc.internal_name));
                    }
                    break;
                case 1:
                    if (get_release_a()){
                        npc.name=get_string("The name that players will see the NPC listed as? (They probably won't see it at all but it never hurts to assign this.)", npc.name);
                    }
                    break;
                case 2:
                    if (get_release_a()){
                        npc.summary=get_string("A short description of the NPC.", npc.summary);
                    }
                    break;
                case 3:
                    // filler
                    break;
                case 4:
                    if (get_release_a()){
                        npc.respawns=!npc.respawns;
                    }
                    break;
                case 5:
                    if (get_release_a()){
                        show_message("You can't do anything with this information, I just thought you might find it interesting.");
                    }
                    break;
            }
        }
        break;
}
