/// data_script_card(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Move:Rot", argument0.editor_state==Editor.movement, argument0, Editor.movement);

data_script_entity(argument0);

if (argument0.editor_state==Editor.movement){
    draw_text(xref+16, 80, "Speed: "+string_format(argument0.action_speed, 1, 2));
    draw_text(xref+16, 96, "Acceleration: "+string_format(argument0.action_acceleration, 1, 4));
    draw_text(xref+16, 112, "Max Speed: "+string_format(argument0.action_speed_max, 1, 4));

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 2);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.action_speed=clamp(get_real("Angular velocity (full rotations per second)?", argument0.action_speed), -argument0.action_speed_max, argument0.action_speed_max)
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.action_acceleration=get_real("Angular acceleration (full rotations per second squared)?", argument0.action_acceleration);
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.action_speed_max=get_real("Maximum angular velocity (full rotations per second)?", argument0.action_speed_max);
                }
                break;
        }
    }
}
