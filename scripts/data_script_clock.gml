/// String data_script_clock(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Clock", argument0.editor_state==Editor.clock, argument0, Editor.clock);

data_script_entity(argument0);

if (argument0.editor_state==Editor.clock){
    draw_text(xref+16, 80, "Hand X: "+string(argument0.hand_x));
    draw_text(xref+16, 96, "Hand Y: "+string(argument0.hand_y));
    draw_text(xref+16, 112, "Hand Z: "+string(argument0.hand_z));
    draw_text(xref+16, 128, "Hand Xscale: "+string(argument0.hand_xscale));
    draw_text(xref+16, 144, "Hand Yscale: "+string(argument0.hand_yscale));
    draw_text(xref+16, 160, "Hand Zscale: "+string(argument0.hand_zscale));
    
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 5);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.hand_x=get_integer("Hand X Offset:", argument0.hand_x);
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.hand_y=get_integer("Hand Y Offset:", argument0.hand_y);
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.hand_z=get_integer("Hand Z Offset:", argument0.hand_z);
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.hand_xscale=get_integer("Hand X Scale:", argument0.hand_xscale);
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.hand_yscale=get_integer("Hand Y Scale:", argument0.hand_yscale);
                }
                break;
            case 5:
                if (get_release_a()){
                    argument0.hand_zscale=get_integer("Hand Z Scale:", argument0.hand_zscale);
                }
                break;
        }
    }
}
