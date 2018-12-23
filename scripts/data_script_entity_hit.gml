/// String data_script_entity_hit(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref-160, 60, "Hit", argument0.editor_state==Editor.hit_sides, argument0, Editor.hit_sides);

if (argument0.editor_state==Editor.hit_sides){
    var c=rg[argument0.hit_flags&HIT_FRONT>0];
    draw_text_colour(xref+16, 80, "Front: "+tf[argument0.hit_flags&HIT_FRONT>0], c, c, c, c, 1);
    var c=rg[argument0.hit_flags&HIT_BACK>0];
    draw_text_colour(xref+16, 96, "Back: "+tf[argument0.hit_flags&HIT_BACK>0], c, c, c, c, 1);
    var c=rg[argument0.hit_flags&HIT_LEFT>0];
    draw_text_colour(xref+16, 112, "Left: "+tf[argument0.hit_flags&HIT_LEFT>0], c, c, c, c, 1);
    var c=rg[argument0.hit_flags&HIT_RIGHT>0];
    draw_text_colour(xref+16, 128, "Right: "+tf[argument0.hit_flags&HIT_RIGHT>0], c, c, c, c, 1);
    var c=c_blue;
    draw_text_colour(xref+16, 144, "Select All", c, c, c, c, 1);
    var c=rg[argument0.hit_flag_stun];
    draw_text_colour(xref+16, 160, "Stun on Wrong Hit: "+tf[argument0.hit_flag_stun], c, c, c, c, 1);
    var c=ternary(argument0.hit_flag_stun, c_black, c_gray);
    draw_text_colour(xref+16, 176, "    Stun Time: "+string(argument0.hit_flag_stun), c, c, c, c, 1);
    
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 6);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.hit_flags=(argument0.hit_flags^HIT_FRONT);
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.hit_flags=(argument0.hit_flags^HIT_BACK);
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.hit_flags=(argument0.hit_flags^HIT_LEFT);
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.hit_flags=(argument0.hit_flags^HIT_RIGHT);
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.hit_flags=HIT_FRONT|HIT_BACK|HIT_LEFT|HIT_RIGHT;
                }
                break;
            case 5:
                if (get_release_a()){
                    argument0.hit_flag_stun=!argument0.hit_flag_stun;
                }
                break;
            case 6:
                if (get_release_a()){
                    argument0.hit_flag_stun_time=clamp(get_real("Stun time for invalid hit?", argument0.hit_flag_stun_time), 0, 60);
                }
                break;
        }
    }
}
