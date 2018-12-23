/// String data_script_door(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Door", argument0.editor_state==Editor.door, argument0, Editor.door);

data_script_entity(argument0);

if (argument0.editor_state==Editor.door){
    if (argument0.state==Misc.closed){
        draw_text(xref+16, 80, "State: Closed");
    } else {
        draw_text(xref+16, 80, "State: Open");
    }
    if (argument0.swing_direction==Misc.clockwise){
        draw_text(xref+16, 96, "Swing Direction: Clockwise");
    } else {
        draw_text(xref+16, 96, "Swing Direction: Counterclockwise");
    }
    draw_text(xref+16, 112, "Locked: "+tf[boolean_flags[argument0.flag, BF_VALUE]==LOCKED]);
    draw_text(xref+16, 128, "Lock index: "+boolean_flags[argument0.flag, BF_NAME]);
    draw_text(xref+16, 144, "Lock Item Package: "+argument0.lock_item_package);
    draw_text(xref+16, 160, "Lock Item: "+ds_map_find_value(all_mod_packages, argument0.lock_item_package).my_items[argument0.lock_item].name);
    draw_text(xref+16, 176, "Swing speed: "+string(argument0.swing_speed));
    draw_text_colour(xref+16, 192, "Set Direction", c_blue, c_blue, c_blue, c_blue, 1);
    
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 7);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    with (argument0){
                        if (state==Misc.open){
                            state=Misc.closed;
                        } else {
                            state=Misc.open;
                        }
                        var dir=direction;
                        direction=target_direction;
                        c_world_remove_object(object);
                        c_world_add_object(object);
                        CollisionObjectTransform(id);
                        direction=dir;
                    }
                }
                break;
            case 1:
                if (get_release_a()){
                    if (argument0.swing_direction==Misc.counterclockwise){
                        argument0.swing_direction=Misc.clockwise;
                    } else {
                        argument0.swing_direction=Misc.counterclockwise;
                    }
                }
                break;
            case 2:
                if (get_release_a()){
                    boolean_flags[argument0.flag, BF_VALUE]=!boolean_flags[argument0.flag, BF_VALUE];
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.flag=get_flag_boolean_from_name(get_string_c("Door lock?", boolean_flags[argument0.flag, BF_NAME]), argument0.flag);
                }
                var len=array_height_2d(boolean_flags);
                if (Controller.release_pleft){
                    argument0.flag=(argument0.flag+len-1)%len;
                } else if (Controller.release_pright){
                    argument0.flag=(argument0.flag+1)%len;
                }
                break;
            case 4:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the lock item can be found in? (If you change this the lock item will be reset.)", argument0.lock_item_package), argument0.lock_item_package);
                    if (argument0.lock_item_package!=lp){
                        argument0.lock_item=0;
                    }
                    argument0.lock_item_package=lp;
                }
                break;
            case 5:
                var arr=ds_map_find_value(all_mod_packages, argument0.lock_item_package).my_items;
                if (get_release_a()){
                    argument0.lock_item=get_item_from_name(argument0.lock_item_package, get_string("Lock item?", arr[argument0.lock_item].name), argument0.lock_item);
                }
                var n=array_length_1d(arr);
                if (Controller.release_pleft){
                    argument0.lock_item=(--argument0.lock_item+n)%n;
                } else if (Controller.release_pright){
                    argument0.lock_item=(++argument0.lock_item)%n;
                }
                break;
            case 6:
                if (get_release_a()){
                    argument0.swing_speed=clamp(get_integer("Swing speed?", argument0.swing_speed), 1, 30);
                }
                if (Controller.release_pleft){
                    argument0.swing_speed=clamp(--argument0.swing_speed, 1, 30);
                } else if (Controller.release_pright){
                    argument0.swing_speed=clamp(++argument0.swing_speed, 1, 30);
                }
                break;
            case 7:
                if (get_release_a()){
                    argument0.target_direction=argument0.direction;
                }
                break;
        }
    }
}
