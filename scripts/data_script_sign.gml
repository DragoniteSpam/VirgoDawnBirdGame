/// String data_script_sign(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Sign", argument0.editor_state==Editor.signpost, argument0, Editor.signpost);

data_script_entity(argument0);

if (argument0.editor_state==Editor.signpost){
    draw_text(xref+16, 96, "Text: "+string(argument0.name));
    draw_text(xref+16, 112, "Color: "+color_names[argument0.color]);
    
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 1);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        if (get_release_a()){
            switch (m){
                case 0:
                    argument0.name=get_string("Sign text?", argument0.name);
                    break;
                case 1:
                    argument0.color=get_color_from_name("Text color?", color_names[argument0.color]);
                    break;
            }
        }
    }
}
