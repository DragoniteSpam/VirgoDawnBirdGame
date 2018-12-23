/// String data_script_fountain(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Fountain", argument0.editor_state==Editor.fountain, argument0, Editor.fountain);

data_script_entity(argument0);

if (argument0.editor_state==Editor.fountain){
    draw_text(xref+16, 80, "Money: $"+string(argument0.money));
    draw_text(xref+16, 96, "Splashiness: "+string(floor(argument0.splashiness)));
    draw_text(xref+16, 112, "Show Base Model: "+tf[argument0.show_visible_model]);
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 2);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.money=clamp(get_integer_c("Money in fountain?", argument0.money), 0, BYTE-1);
                }
                break;
            case 1:
                if (Controller.pleft){
                    argument0.splashiness=(argument0.splashiness+BYTE-1.25)%BYTE;
                } else if (Controller.pright){
                    argument0.splashiness=(argument0.splashiness+0.25)%BYTE;
                }
                if (get_release_a()){
                    argument0.splashiness=clamp(get_integer_c("Splashiness of the fountain? (16 = default)", floor(argument0.splashiness)), 0, BYTE-1);
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.show_visible_model=!argument0.show_visible_model;
                }
                break;
        }
    }
}
