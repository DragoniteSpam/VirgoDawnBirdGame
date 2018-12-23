/// String data_script_collectable(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Collectable", argument0.editor_state==Editor.collectable, argument0, Editor.collectable);

data_script_entity(argument0);

if (argument0.editor_state==Editor.collectable){
    draw_text(xref+16, 80, "Value: "+string(argument0.value));
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 0);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.value=get_integer_c("Collectable value (Default is 1)?", argument0.value);
                }
                if (World.frames%5){
                    if (Controller.pleft){
                        argument0.value=(--argument0.value+BYTE)%BYTE;
                    } else if (Controller.pright){
                        argument0.value=(++argument0.value)%BYTE;
                    }
                }
                break;
        }
    }
}
