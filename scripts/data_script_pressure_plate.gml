/// String data_script_pressure_plate(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "P. Plate", argument0.editor_state==Editor.pressureplate, argument0, Editor.pressureplate);

data_script_entity(argument0);

if (argument0.editor_state==Editor.pressureplate){
    draw_text(xref+16, 80, "Action package: "+argument0.action_package);
    draw_text(xref+16, 96, "Action? "+ds_map_find_value(all_mod_packages, argument0.action_package).my_pressure_plate_actions[argument0.action].name);
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 1);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    var lp=get_mod_package_from_name(get_string("Package that the pressure plate action can be found in? (If you change this the action will be reset.)", argument0.action_package), argument0.action_package);
                    if (argument0.action_package!=lp){
                        argument0.action=0;
                    }
                    argument0.action_package=lp;
                }
                break;
            case 1:
                var array=ds_map_find_value(all_mod_packages, argument0.action_package).my_pressure_plate_actions;
                var len=array_length_1d(array);
                if (get_release_a()){
                    argument0.action=get_pressure_plate_action_from_name(get_string("Pressure Plate Action:", array[argument0.action].name), argument0.action);
                } else if (Controller.release_left){
                    argument0.action=(--argument0.action+len)%len;
                } else if (Controller.release_right){
                    argument0.action=++argument0.action%len;
                }
                break;
        }
    }
}
