/// String data_script_event(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref+160, 4, "Event", argument0.editor_state==Editor.event, argument0, Editor.event);

data_script_default(argument0);

if (argument0.editor_state==Editor.event){
    draw_text(xref+16, 80, "Default text");
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 1);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                break;
        }
    }
}
