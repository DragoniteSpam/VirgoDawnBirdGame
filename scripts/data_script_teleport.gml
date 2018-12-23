/// data_script_card(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Teleport", argument0.editor_state==Editor.teleport, argument0, Editor.teleport);

data_script_entity(argument0);

if (argument0.editor_state==Editor.teleport){
    draw_text(xref+16, 80, "DestMap Package: "+argument0.var_map_package);
    draw_text(xref+16, 96, "DestMap: "+ds_map_find_value(all_mod_packages, argument0.var_map_package).my_maps[argument0.var_map].name);
    draw_text(xref+16, 112, "DestMark: "+string(teleport_spots[# argument0.var_marker, 0])); // cast to string just in case it hasn't been defined yet
    draw_text(xref+16, 128, "Required Key Package: "+argument0.var_key_package);
    draw_text(xref+16, 144, "Required Key: "+ds_map_find_value(all_mod_packages, argument0.var_key_package).my_items[argument0.var_key].name);

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 4);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the destination map can be found in? (If you change this the destination map will be reset.)", argument0.var_map_package), argument0.var_map_package);
                    if (argument0.var_map_package!=lp){
                        argument0.var_map=0;
                    }
                    argument0.var_map_package=lp;
                }
                break;
            case 1:
                var arr=ds_map_find_value(all_mod_packages, argument0.var_map_package).my_maps;
                if (get_release_a()){
                    argument0.var_map=get_map_from_name(get_string("Map index?", arr[argument0.var_map].name), argument0.var_map);
                }
                var n=array_length_1d(arr);
                if (Controller.press_pleft){
                    argument0.var_map=(argument0.var_map+n-1)%n;
                } else if (Controller.press_pright){
                    argument0.var_map=(argument0.var_map+n+1)%n;
                }
                break;
            case 2:
                if (get_release_a()){
                    var name=get_string("Teleport Spot index?", teleport_spots[# argument0.var_marker, 0]);
                    for (var i=0; i<ds_grid_width(teleport_spots); i++){
                        if (string_minimal(name)==string_minimal(string(teleport_spots[# i, 0]))){
                            argument0.var_marker=i;
                            break;
                        }
                    }
                }
                var n=ds_grid_width(teleport_spots);
                if (Controller.press_pleft){
                    argument0.var_marker=(argument0.var_marker+n-1)%n;
                } else if (Controller.press_pright){
                    argument0.var_marker=(argument0.var_marker+n+1)%n;
                }
                break;
            case 3:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the non-random loot can be found in? (If you change this the non-random loot will be reset.)", argument0.loot_package), argument0.loot_package);
                    if (argument0.var_key_package!=lp){
                        argument0.var_key=0;
                    }
                    argument0.var_key_package=lp;
                }
                break;
            case 4:
                var arr=ds_map_find_value(all_mod_packages, argument0.var_key_package).my_items;
                if (get_release_a()){
                    argument0.var_key=get_item_from_name(argument0.var_key_package, get_string("Key (item) index?", arr[argument0.var_key].name), argument0.var_key);
                }
                var n=array_length_1d(arr);
                if (Controller.press_pleft){
                    argument0.var_key=(argument0.var_key+n-1)%n;
                } else if (Controller.press_pright){
                    argument0.var_key=(argument0.var_key+n+1)%n;
                }
                break;
        }
    }
}
