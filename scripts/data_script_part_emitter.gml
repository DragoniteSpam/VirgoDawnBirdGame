/// String data_script_part_emitter(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Emitter", argument0.editor_state==Editor.emitter, argument0, Editor.emitter);

data_script_entity(argument0);

if (argument0.editor_state==Editor.emitter){
    draw_text(xref+16, 80, "Emit green? "+tf[argument0.emit_green]);
    draw_text(xref+16, 96, "Emit blue? "+tf[argument0.emit_water]);
    draw_text(xref+16, 112, "Emit warm? "+tf[argument0.emit_warm]);
    draw_text(xref+16, 128, "Emit gray? "+tf[argument0.emit_grayscale]);
    draw_text(xref+16, 144, "Density (per second) "+string(argument0.density));
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 4);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    argument0.emit_green=!argument0.emit_green;
                }
                break;
            case 1:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    argument0.emit_water=!argument0.emit_water;
                }
                break;
            case 2:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    argument0.emit_warm=!argument0.emit_warm;
                }
                break;
            case 3:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    argument0.emit_grayscale=!argument0.emit_grayscale;
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.density=clamp(get_integer("Particles per second?", argument0.density), 0, BYTE-1);
                }
                if (Controller.release_left){
                    argument0.density=(--argument0.density+BYTE)%BYTE;
                }
                if (Controller.release_right){
                    argument0.density=++argument0.density%BYTE;
                }
                break;
        }
    }
}
