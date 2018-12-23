/// String data_script_entity_combat(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref-160, 4, "Combat", argument0.editor_state==Editor.combat, argument0, Editor.combat);

if (argument0.editor_state==Editor.combat){
    argument0.equip_weapon=min(argument0.equip_weapon, array_length_1d(ds_map_find_value(all_mod_packages, argument0.equip_weapon_package).my_items)-1);
    argument0.equip_shield=min(argument0.equip_shield, array_length_1d(ds_map_find_value(all_mod_packages, argument0.equip_shield_package).my_items)-1);

    draw_text(xref+16, 80, "Class: "+all_classes[argument0.class].name);
    draw_text(xref+16, 96, "Cancel Combat");
    draw_text(xref+16, 112, "HP Level: "+string(argument0.exp_hp));
    draw_text(xref+16, 128, "MP Level: "+string(argument0.exp_mp));
    draw_text_colour(xref+48, 144, "Calculated HP: "+string(get_max_hp(argument0.exp_hp)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text_colour(xref+48, 160, "Calculated Magic: "+string(get_max_mp(argument0.exp_mp)), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    draw_text(xref+16, 192, "Equip Weapon Package: "+argument0.equip_weapon_package);
    draw_text(xref+16, 208, "Equip Weapon: "+ds_map_find_value(all_mod_packages, argument0.equip_weapon_package).my_items[argument0.equip_weapon].name);
    draw_text(xref+16, 224, "Equip Shield Package: "+argument0.equip_shield_package);
    draw_text(xref+16, 240, "Equip Shield: "+ds_map_find_value(all_mod_packages, argument0.equip_shield_package).my_items[argument0.equip_shield].name);
    draw_text(xref+16, 256, "Combat Music Package: "+argument0.combat_music_package);
    draw_text(xref+16, 256, "Combat Music: "+ds_map_find_value(all_mod_packages, argument0.combat_music_packge).my_bgm[argument0.combat_music].name);
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 12);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.class=get_class_from_name(get_string("Class?", all_classes[argument0.class].name), argument0.class);
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.aggro_target=noone;
                }
                break;
            case 2:
                var n=BYTE;
                if (get_release_a()){
                    argument0.exp_hp=clamp(get_integer("Heart Containers?", argument0.exp_hp), 0, BYTE);
                } else if (Controller.release_left){
                    argument0.exp_hp=(--argument0.exp_hp+n)%n;
                } else if (Controller.release_right){
                    argument0.exp_hp=(++argument0.exp_hp+n)%n;
                }
                argument0.hp_current=get_max_hp(argument0.exp_hp);
                break;
            case 3:
                var n=BYTE;
                if (get_release_a()){
                    argument0.exp_mp=clamp(get_integer("MP Containers?", argument0.exp_mp), 0, BYTE);
                } else if (Controller.release_left){
                    argument0.exp_mp=(--argument0.exp_mp+n)%n;
                } else if (Controller.release_right){
                    argument0.exp_mp=(++argument0.exp_mp+n)%n;
                }
                argument0.mp_current=get_max_hp(argument0.exp_mp);
                break;
            case 4:
                // Display HP
                break;
            case 5:
                // Display MP
                break;
            case 6:
                break;
            case 7:
                if (get_release_a()){
                    var new=get_string("Equipped weapon mod package?", argument0.equip_weapon_package);
                    if (ds_map_exists(all_mod_packages, new)){
                        argument0.equip_weapon_package=new;
                        argument0.equip_weapon=min(argument0.equip_weapon, array_length_1d(ds_map_find_value(all_mod_packages, new).my_items)-1);
                    }
                }
                break;
            case 8:
                var arr=ds_map_find_value(all_mod_packages, argument0.equip_weapon_package).my_items;
                var n=array_length_1d(arr);
                if (get_release_a()){
                    argument0.equip_weapon=get_item_from_name(argument0.equip_weapon_package, get_string("Equipped weapon?", arr[argument0.equip_weapon].name), argument0.equip_weapon);
                }
                if (Controller.release_pleft){
                    argument0.equip_weapon=(--argument0.equip_weapon+n)%n;
                } else if (Controller.release_pright){
                    argument0.equip_weapon=++argument0.equip_weapon%n;
                }
                break;
            case 9:
                if (get_release_a()){
                    var new=get_string("Equipped shield mod package?", argument0.equip_shield_package);
                    if (ds_map_exists(all_mod_packages, new)){
                        argument0.equip_shield_package=new;
                        argument0.equip_shield=min(argument0.equip_shield, array_length_1d(ds_map_find_value(all_mod_packages, new).my_items)-1);
                    }
                }
                break;
            case 10:
                var arr=ds_map_find_value(all_mod_packages, argument0.equip_shield_package).my_items;
                var n=array_length_1d(arr);
                if (get_release_a()){
                    argument0.equip_shield=get_item_from_name(argument0.equip_shield_package, get_string("Equipped shield?", arr[argument0.equip_shield].name), argument0.equip_shield);
                }
                if (Controller.release_pleft){
                    argument0.equip_shield=(--argument0.equip_shield+n)%n;
                } else if (Controller.release_pright){
                    argument0.equip_shield=++argument0.equip_shield%n;
                }
                break;
            case 11:
                if (get_release_a()){
                    var new=get_string("Combat music mod package?", argument0.combat_music_package);
                    if (ds_map_exists(all_mod_packages, new)){
                        argument0.combat_music_package=new;
                        argument0.equip_shield=min(argument0.equip_shield, array_length_1d(ds_map_find_value(all_mod_packages, new).my_bgm)-1);
                    }
                }
                break;
            case 12:
                var package=ds_map_find_value(all_mod_packages, argument0.combat_music_package);
                var n=array_length_1d(package.my_bgm);
                if (get_release_a()){
                    argument0.combat_music=get_bgm_from_name(argument0.combat_music_package, get_string("Combat Music?", package.my_bgm[argument0.combat_music].name), argument0.combat_music);
                }
                if (Controller.release_pleft){
                    argument0.combat_music=(--argument0.combat_music+n)%n;
                } else if (Controller.release_pright){
                    argument0.combat_music=++argument0.combat_music%n;
                }
                break;
        }
    }
}
