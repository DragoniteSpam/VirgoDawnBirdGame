/// String data_script_sproing(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Sproing", argument0.editor_state==Editor.sproing, argument0, Editor.sproing);

data_script_entity(argument0);

if (argument0.editor_state==Editor.sproing){
    draw_text(xref+16, 80, "Target X: "+string(argument0.sproing_target_x));
    draw_text(xref+16, 96, "Target Y: "+string(argument0.sproing_target_y));
    draw_text(xref+16, 112, "Target Z: "+string(argument0.sproing_target_z));
    draw_text(xref+16, 128, "Target Height: "+string(argument0.sproing_target_height));
    draw_text(xref+16, 144, "Set sproing target");
    draw_text(xref+16, 160, "Sproing Equation: "+ternary(argument0.sproing_equation==Misc.sproing_eq_2, 'd/(4*at)', 'd/(2*at)'));
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 5);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.sproing_target_x=get_integer("Sproing target X?", argument0.sproing_target_x);
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.sproing_target_y=get_integer("Sproing target Y?", argument0.sproing_target_y);
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.sproing_target_z=get_integer("Sproing target Z?", argument0.sproing_target_z);
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.sproing_target_height=get_integer("Sproing target height?", argument0.sproing_target_height);
                }
                break;
            case 4:
                if (get_release_a()&&show_question("Set sproing target to Camera position?")){
                    argument0.sproing_target_x=Camera.x;
                    argument0.sproing_target_y=Camera.y;
                    argument0.sproing_target_z=Camera.z-EYE_LEVEL;
                }
                // Text
                break;
            case 5:
                if (get_release_a()){
                    if (argument0.sproing_equation==Misc.sproing_eq_2){
                        argument0.sproing_equation=Misc.sproing_eq_4;
                    } else {
                        argument0.sproing_equation=Misc.sproing_eq_2;
                    }
                }
                break;
        }
    }
}
