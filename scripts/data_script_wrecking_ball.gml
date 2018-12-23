/// String data_script_wrecking_ball(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Wrck. Ball", argument0.editor_state==Editor.wrecking_ball, argument0, Editor.wrecking_ball);

data_script_entity(argument0);

if (argument0.editor_state==Editor.wrecking_ball){
    draw_text(xref+16, 80, "Chain Length: "+string(argument0.chain_length));
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 0);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.chain_length=get_integer("Chain length?", argument0.chain_length);
                }
                if (Controller.press_pleft){
                    argument0.chain_length=(--argument0.chain_length+BYTE)%BYTE;
                } else if (Controller.press_pright){
                    argument0.chain_length=(++argument0.chain_length)%BYTE;
                }
                break;
        }
    }
    argument0.ball_direction=argument0.direction;
}
