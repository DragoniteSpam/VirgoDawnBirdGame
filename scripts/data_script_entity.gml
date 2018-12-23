/// String data_script_entity(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref+160, 4, "Entity", argument0.editor_state==Editor.entity, argument0, Editor.entity);

data_script_default(argument0);

data_script_entity_combat(argument0);
data_script_entity_stats(argument0);
data_script_entity_hit(argument0);

if (argument0.editor_state==Editor.entity){
    if (ds_map_exists(cutscene_map, argument0.death_cutscene)){
        var death_cutscene_name=cutscene_map[? argument0.death_cutscene].name;
    } else {
        var death_cutscene_name="";
    }
    if (ds_map_exists(cutscene_map, argument0.bleedout_cutscene)){
        var bleedout_cutscene_name=cutscene_map[? argument0.bleedout_cutscene].name;
    } else {
        var bleedout_cutscene_name="";
    }
    draw_text(xref+16, 80, "Form index: "+string(argument0.model_index)+" (of "+string(array_length_1d(get_model_object(argument0).model_array)-1)+")");
    var txt=argument0.text;
    if (string_length(txt)>64){
        txt=string_copy(txt, 1, 61)+"...";
    }
    draw_set_valign(fa_top);
    draw_text_ext(xref+16, 88, "Instance Text: "+txt, 16, 256);
    draw_set_valign(fa_middle);
    draw_text(xref+16, 144, "Hidden: "+tf[argument0.hidden]);
    draw_text(xref+16, 160, "Legilimens: "+all_legilimens_names[argument0.legilimens_text]);
    draw_text(xref+16, 176, "On Death: "+all_death_scripts[argument0.on_death].name);
    draw_text(xref+16, 192, "Handedness: "+ternary(argument0.handedness==Misc.right, "Right", "Left"));
    var c=rg[argument0.occlude];
    draw_text_colour(xref+16, 208, "Occlude: "+tf[argument0.occlude], c, c, c, c, 1);
    draw_text(xref+16, 224, "Item Package: "+argument0.loot_package);
    draw_text(xref+16, 240, "Item: "+ds_map_find_value(all_mod_packages, argument0.loot_package).my_items[argument0.loot].name);
    draw_text(xref+16, 256, "Quantity: "+string(argument0.loot_quantity));
    draw_text(xref+16, 272, "Pickup Flag: "+boolean_flags[argument0.loot_flag, 1]);
    draw_text(xref+16, 288, "On Hit: "+script_get_name(all_hit_scripts[argument0.on_hit]));
    draw_text(xref+16, 304, "Death Cutscene: "+death_cutscene_name);
    draw_text(xref+16, 320, "Bleedout Cutscene: "+bleedout_cutscene_name);
    var c=rg[argument0.bleedout_reset_aggro];
    draw_text_colour(xref+16, 336, "Reset on Bleedout: "+tf[argument0.bleedout_reset_aggro], c, c, c, c, 1);
    var c=rg[argument0.gravity_force];
    draw_text_colour(xref+16, 352, "Gravity Force: "+tf[argument0.gravity_force], c, c, c, c, 1);
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 17);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                var n=array_length_1d(get_model_object(argument0).model_array);
                if (get_release_a()){
                    if (n>1){
                        argument0.model_index=min(get_integer_c("Model form index? ("+get_model_object(argument0).name+" forms 0 through "+string(n-1)+" are available.)", argument0.model_index), n-1);
                    }
                }
                if (Controller.release_pleft){
                    argument0.model_index=(--argument0.model_index+n)%n;
                } else if (Controller.release_pright){
                    argument0.model_index=++argument0.model_index%n;
                }
                break;
            case 1:
            case 2:
            case 3:
                draw_rectangle_texture_auto(W/2-128, H/2-128, W/2+128, H/2+128, true);
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_text_colour(W/2, H/2, argument0.text, c_black, c_black, c_black, c_black, 1);
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
                if (get_release_a()){
                    argument0.text=get_string("Generic text?", argument0.text);
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.hidden=!argument0.hidden;
                    if (argument0.alive&&!argument0.hidden){
                        argument0.mask=COLLISION_PRIMARY;
                        c_object_set_mask(argument0.object, argument0.mask, argument0.mask);
                    } else {
                        argument0.mask=COLLISION_DONT_MESS_WITH_ME;
                        c_object_set_mask(argument0.object, argument0.mask, argument0.mask);
                    }
                }
                break;
            case 5:
                if (get_release_a()){
                    var str=string_minimal(get_string_c("Legilimens text?", all_legilimens_names[argument0.legilimens_text]));
                    for (var i=0; i<array_length_1d(all_legilimens_names); i++){
                        if (string_minimal(all_legilimens_names[i])==str){
                            argument0.legilimens_text=i;
                            break;
                        }
                    }
                }
                if (Controller.press_pleft){
                    var n=array_length_1d(all_legilimens_names);
                    argument0.legilimens_text=(argument0.legilimens_text+n-1)%n;
                } else if (Controller.press_pright){
                    var n=array_length_1d(all_legilimens_names);
                    argument0.legilimens_text=(argument0.legilimens_text+n+1)%n;
                }
                break;
            case 6:
                if (get_release_a()){
                    argument0.on_death=get_death_script_from_name(get_string("Death script?", all_death_scripts[argument0.on_death].name), argument0.on_death);
                }
                if (Controller.press_pleft){
                    var n=array_length_1d(all_death_scripts);
                    argument0.on_death=(argument0.on_death+n-1)%n;
                } else if (Controller.press_pright){
                    var n=array_length_1d(all_death_scripts);
                    argument0.on_death=(argument0.on_death+n+1)%n;
                }
                break;
            case 7:
                if (get_release_a()){
                    argument0.handedness=ternary(argument0.handedness==Misc.right, Misc.left, Misc.right);
                }
                break;
            case 8:
                if (get_release_a()){
                    argument0.occlude=!argument0.occlude;
                }
                break;
            case 9:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the non-random loot can be found in? (If you change this the non-random loot will be reset.)", argument0.loot_package), argument0.loot_package);
                    if (argument0.loot_package!=lp){
                        argument0.loot=0;
                    }
                    argument0.loot_package=lp;
                }
                break;
            case 10:
                var arr=ds_map_find_value(all_mod_packages, argument0.loot_package).my_items;
                var len=array_length_1d(arr);
                if (get_release_a()){
                    argument0.loot=get_item_from_name(argument0.loot_package, get_string("Item:", arr[argument0.loot].name), argument0.loot);
                } else if (Controller.release_left){
                    argument0.loot=(--argument0.loot+len)%len;
                } else if (Controller.release_right){
                    argument0.loot=++argument0.loot%len;
                }
                break;
            case 11:
                var len=2<<32;
                if (get_release_a()){
                    argument0.loot_quantity=get_integer("Quantity:", argument0.loot_quantity);
                } else if (Controller.release_left){
                    argument0.loot_quantity=(--argument0.loot_quantity+len)%len;
                } else if (Controller.release_right){
                    argument0.loot_quantity=++argument0.loot_quantity%len;
                }
                break;
            case 12:
                var len=2<<10;
                if (get_release_a()){
                    argument0.loot_flag=get_flag_boolean_from_name(get_string("Flag that must be Unlocked to pick up this item:", boolean_flags[argument0.loot_flag, 1]), argument0.loot_flag);
                } else if (Controller.release_left){
                    argument0.loot_flag=(--argument0.loot_flag+len)%len;
                } else if (Controller.release_right){
                    argument0.loot_flag=++argument0.loot_flag%len;
                }
                break;
            case 13:
                if (get_release_a()){
                    var str=string_minimal(get_string_c("On hit?", script_get_name(all_hit_scripts[argument0.on_hit])));
                    argument0.on_hit=get_hit_script_from_name(str, argument0.on_hit);
                }
                break;
            case 14:
                if (get_release_a()){
                    var str=string_minimal(get_string_c("Cutscene on death?", death_cutscene_name));
                    argument0.death_cutscene=get_cutscene_from_name(str, argument0.death_cutscene);
                }
                break;
            case 15:
                if (get_release_a()){
                    var str=string_minimal(get_string_c("Cutscene on bleedout?", bleedout_cutscene_name));
                    argument0.bleedout_cutscene=get_cutscene_from_name(str, argument0.bleedout_cutscene);
                }
                break;
            case 16:
                if (get_release_a()){
                    argument0.bleedout_reset_aggro=!argument0.bleedout_reset_aggro;
                }
                break;
            case 17:
                if (get_release_a()){
                    argument0.gravity_force=!argument0.gravity_force;
                }
                break;
        }
    }
}
