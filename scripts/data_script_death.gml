/// data_script_card(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Grave", argument0.editor_state==Editor.death, argument0, Editor.death);

data_script_entity(argument0);

if (argument0.editor_state==Editor.death){
    draw_text(xref+16, 80, "Born");
    draw_text(xref+16, 96, argument0.born);
    draw_text(xref+16, 112, "Died");
    draw_text(xref+16, 128, argument0.died);
    draw_text(xref+16, 144, "Epitaph");
    draw_set_halign(fa_top);
    draw_text_ext(xref+16, 160, argument0.summary, -1, W-64);

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 4);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
            case 1:
                if (get_release_a()){
                    argument0.born=get_string_c("Date born? (You can technically enter any string of words, it doesn't have to be formatted as a date.", argument0.born);
                }
                break;
            case 2:
            case 3:
                if (get_release_a()){
                argument0.died=get_string_c("Date died? (You can technically enter any string of words, it doesn't have to be formatted as a date.", argument0.died);
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.summary=get_string_c("Epitaph? (It should probably be a bit more serious than the default one.)", argument0.summary);
                }
                break;
        }
    }
}
