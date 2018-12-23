/// String data_script_heart(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Heart", argument0.editor_state==Editor.heart, argument0, Editor.heart);

data_script_event(argument0);

if (argument0.editor_state==Editor.heart){
    draw_text(xref+16, 80, "Heal Full? "+tf[argument0.heal_full]);
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 0);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()||Controller.release_right||Controller.release_left){
                    argument0.heal_full=!argument0.heal_full;
                }
                break;
        }
    }
}
