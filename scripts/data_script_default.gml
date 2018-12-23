/// String data_script_default(object);

var xref=W-320;

draw_rectangle_texture_auto_box(xref, 4, "Select.", argument0.editor_state==Editor.def, argument0, Editor.def);

draw_rectangle_texture_auto(xref, 64, W-32, 416, true);

if (argument0.editor_state==Editor.def){
    if (keyboard_check_pressed(vk_f11)){
        argument0.checked=!argument0.checked;
    }
    if (ds_map_exists(cutscene_map, argument0.cutscene_index)){
        var cutscene_name=cutscene_map[? argument0.cutscene_index].name;
    } else {
        var cutscene_name="";
    }
    draw_text(xref+16, 80, "Display name: "+argument0.name);
    draw_text(xref+16, 96, "Mod Package: "+argument0.mod_package);
    draw_text(xref+16, 112, "X: "+string(argument0.x));
    draw_text(xref+16, 128, "Y: "+string(argument0.y));
    draw_text(xref+16, 144, "Z: "+string(argument0.z));
    draw_text(xref+16, 160, "X Rotation: "+string(argument0.xrot));
    draw_text(xref+16, 176, "Y Rotation: "+string(argument0.yrot));
    draw_text(xref+16, 192, "Z Rotation: "+string(argument0.direction));
    draw_text(xref+16, 208, "Cutscene Package: "+argument0.cutscene_package);
    draw_text(xref+16, 224, "Cutscene: "+cutscene_name);
    draw_text(xref+16, 240, "NPC Package: "+argument0.npc_package);
    draw_text(xref+16, 256, "NPC: "+ds_map_find_value(all_mod_packages, argument0.npc_package).my_npcs[argument0.npc_index].name);
    draw_text(xref+16, 272, "Locked? "+tf[argument0.locked]);
    draw_text(xref+16, 288, "Randomize Orientation");
    draw_text(xref+16, 304, "Snap to grid of: "+string(World.edit_snap));
    draw_text_colour(xref+16, 320, "Register to NPC", c_blue, c_blue, c_blue, c_blue, 1);
    draw_text(xref+16, 336, "Set Origin Here");
    draw_text(xref+16, 352, "Internal ID: "+string(argument0.id));
    draw_text(xref+16, 368, "Checklisted: "+tf[argument0.checked]);
    draw_text(xref+16, 384, "Alive: "+tf[argument0.alive]);

    if (mouse_within_rectangle(xref, 64, W-32, 416)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 19);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.name=get_string_c("Text that shows up when you land your crosshairs on the collision model. Leave it blank for no text box to show up.", argument0.name);
                }
                break;
            case 1:
                if (get_release_a()){
                    var p=get_string("Mod package for this entity to use? (Affects referenced models, items, etc.)", argument0.mod_package);
                    if (ds_map_exists(all_mod_packages, p)){
                        argument0.mod_package=p;
                    }
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.x=get_integer_c("X coordinate on the map?", argument0.x);
                    argument0.lerp_target_x=argument0.x;
                }
                editor_apply_transformation();
                break;
            case 3:
                if (get_release_a()){
                    argument0.y=get_integer_c("Y coordinate on the map?", argument0.y);
                    argument0.lerp_target_y=argument0.y;
                }
                editor_apply_transformation();
                break;
            case 4:
                if (get_release_a()){
                    argument0.z=get_integer_c("Z coordinate on the map?", argument0.z);
                    argument0.lerp_target_z=argument0.z;
                }
                editor_apply_transformation();
                break;
            case 5:
                if (get_release_a()){
                    argument0.xrot=get_integer_c("X rotation (roll)?", argument0.xrot);
                }
                editor_apply_transformation();
                break;
            case 6:
                if (get_release_a()){
                    argument0.yrot=get_integer_c("Y rotation (pitch)?", argument0.yrot);
                }
                editor_apply_transformation();
                break;
            case 7:
                if (get_release_a()){
                    argument0.direction=get_integer_c("Z rotation (direction)?", argument0.direction);
                }
                editor_apply_transformation();
                break;
            case 8:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the cutscene can be found in? (If you change this the cutscene will be reset.)", argument0.cutscene_package), argument0.cutscene_package);
                    if (argument0.cutscene_package!=lp){
                        argument0.cutscene_index=0;
                    }
                    argument0.cutscene_package=lp;
                }
                break;
            case 9:
                if (get_release_a()){
                    var str=string_minimal(get_string_c("Cutscene?", cutscene_name));
                    argument0.cutscene_index=get_cutscene_from_name(str, argument0.cutscene_index);
                }
                break;
            case 10:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the registered NPC can be found in? (If you change this the NPC will be reset.)", argument0.npc_package), argument0.npc_package);
                    if (argument0.npc_package!=lp){
                        argument0.npc_index=0;
                    }
                    argument0.npc_package=lp;
                }
                break;
            case 11:
                var arr=ds_map_find_value(all_mod_packages, argument0.npc_package).my_npcs;
                if (get_release_a()){
                    argument0.npc_index=get_npc_from_name(argument0.npc_package, get_string("NPC Index? (This is different from Cutscene Index.)", arr[argument0.npc_index].name), argument0.npc_index);
                }
                var n=array_length_1d(arr);
                if (Controller.press_pleft){
                    argument0.npc_index=(argument0.npc_index+n-1)%n;
                } else if (Controller.press_pright){
                    argument0.npc_index=(argument0.npc_index+n+1)%n;
                }
                break;
            case 12:
                if (get_release_a()){
                    argument0.locked=!argument0.locked;
                }
                break;
            case 13:
                if (get_release_a()){
                    if (show_question("Randomize orientation? (This is mainly to be used for rocks and other landscaping set pieces.)")){
                        argument0.xrot=irandom(359);
                        argument0.yrot=irandom(359);
                        argument0.direction=irandom(359);
                    }
                }
                break;
            case 14:
                if (get_release_a()){
                    World.edit_snap=get_real_c("Snap objects to a grid of (0 to turn it off):", World.edit_snap);
                }
                break;
            case 15:
                if (get_release_a()){
                    var actor=ds_map_find_value(all_mod_packages, argument0.npc_package).my_npcs[argument0.npc_index].actor;
                    if (actor!=argument0){
                        if (actor==noone){
                            register(argument0, argument0.npc_package, argument0.npc_index);
                        } else {
                            if (show_question("Register this NPC to "+ds_map_find_value(all_mod_packages, argument0.npc_package).my_npcs[argument0.npc_index].name+". Are you sure you want to do this?"+
                                "#This will replace "+string(actor)+" @ "+string(actor.x)+", "+string(actor.y)+", "+string(actor.z)+".")){
                                register(argument0, argument0.npc_package, argument0.npc_index);
                            }
                        }
                    }
                }
                break;
            case 16:
                if (get_release_a()){
                    argument0.xstart=argument0.x;
                    argument0.ystart=argument0.y;
                    argument0.zstart=argument0.z;
                }
                break;
            case 17:
                // Nothing, just the instance ID
                break;
            case 18:
                if (get_release_a()){
                    argument0.checked=!argument0.checked;
                }
                break;
            case 19:
                if (get_release_a()){
                    with (argument0){
                        set_alive(!alive);
                    }
                    if (argument0.alive&&!argument0.hidden){
                        if (argument0.object==noone){
                            script_execute(collision_adder, id);
                        }
                        mask=COLLISION_PRIMARY;
                        c_object_set_mask(argument0.object, mask, mask);
                    } else {
                        mask=COLLISION_DONT_MESS_WITH_ME;
                        c_object_set_mask(argument0.object, mask, mask);
                    }
                }
                break;
        }
    }
}
