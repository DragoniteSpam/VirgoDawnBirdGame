/// String data_script_bulb(object);

var xref=W-320;

draw_rectangle_texture_auto_box(xref, 32, "FlowerBulb", argument0.editor_state==Editor.bulb, argument0, Editor.bulb);

data_script_entity(argument0);

if (argument0.editor_state==Editor.bulb){
    if (argument0.size==Misc.large){
        draw_text(xref+16, 80, "Size: Large");
    } else {
        draw_text(xref+16, 80, "Size: Small");
    }

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 0);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    if (argument0.size==Misc.large){
                        argument0.size=Misc.small;
                    } else {
                        argument0.size=Misc.large;
                    }
                }
                break;
        }
    }
}
