/// String data_script_cooking(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Cooking", argument0.editor_state==Editor.cooking, argument0, Editor.cooking);

data_script_entity(argument0);

if (argument0.editor_state==Editor.cooking){
    draw_text(xref+16, 80, "Nothing extra here.");
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 0);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                break;
        }
    }
}
