/// String data_script_cauldron_k(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "CauldronK", argument0.editor_state==Editor.chest, argument0, Editor.chest);

data_script_entity(argument0);

if (argument0.editor_state==Editor.chest){
    var item=ds_map_find_value(all_mod_packages, argument0.loot_package).my_items[argument0.loot];
    
    draw_text(xref+16, 80, "Random loot? "+tf[argument0.loot_random]);
    if argument0.loot_random {
        draw_text_colour(xref+16, 96, "Loot Package: "+argument0.loot_package, c_gray, c_gray, c_gray, c_gray, 1);
        draw_text_colour(xref+16, 112, "Loot: "+item.name, c_gray, c_gray, c_gray, c_gray, 1);
    } else {
        draw_text(xref+16, 96, "Loot Package: "+argument0.loot_package);
        draw_text(xref+16, 112, "Loot: "+item.name);
    }
    draw_text(xref+16, 128, "Quantity: "+string(argument0.loot_quantity));
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 3);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    argument0.loot_random=!argument0.loot_random;
                }
                break;
            case 1:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the non-random loot can be found in? (If you change this the non-random loot will be reset.)", argument0.loot_package), argument0.loot_package);
                    if (argument0.loot_package!=lp){
                        argument0.loot=0;
                    }
                    argument0.loot_package=lp;
                }
                break;
            case 2:
                var arr=ds_map_find_value(all_mod_packages, argument0.loot_package);
                var len=array_length_1d(arr);
                if (get_release_a()){
                    argument0.loot=get_item_from_name(argument0.loot_package, get_string("Item:", arr[argument0.loot].name), argument0.loot);
                } else if (Controller.release_left){
                    argument0.loot=(--argument0.loot+len)%len;
                } else if (Controller.release_right){
                    argument0.loot=++argument0.loot%len;
                }
                break;
            case 3:
                var len=2<<32;
                if (get_release_a()){
                    argument0.loot_quantity=get_integer("Quantity:", argument0.loot_quantity);
                } else if (Controller.release_left){
                    argument0.loot_quantity=(--argument0.loot_quantity+len)%len;
                } else if (Controller.release_right){
                    argument0.loot_quantity=++argument0.loot_quantity%len;
                }
                break;
        }
    }
}
