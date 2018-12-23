/// data_script_card(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Fire", argument0.editor_state==Editor.fire, argument0, Editor.fire);

data_script_entity(argument0);

if (argument0.editor_state==Editor.fire){
    draw_text(xref+16, 80, "Lit? "+tf[argument0.lit]);
    draw_text(xref+16, 96, "Scale: "+string(argument0.scale));
    draw_text(xref+16, 112, "Density: "+string(argument0.density));
    draw_text(xref+16, 128, "LightOffsetX: "+string(argument0.offset_light_x));
    draw_text(xref+16, 144, "LightOffsetY: "+string(argument0.offset_light_y));
    draw_text(xref+16, 160, "LightOffsetZ: "+string(argument0.offset_light_z));
    draw_text(xref+16, 176, "LightRange: "+string(argument0.range_default));
    draw_text(xref+16, 192, "LightFlicker: "+string(argument0.range_flicker));

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 7);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.lit=!argument0.lit;
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.scale=get_integer_c("Fire scale?", argument0.scale)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.scale=(argument0.scale+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.scale=(argument0.scale+1)%BYTE;
                    }
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.density=get_integer_c("How many particles per frame?", argument0.density)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.density=(argument0.density+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.density=(argument0.density+1)%BYTE;
                    }
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.offset_light_x=get_integer_c("Light offset X?", argument0.offset_light_x)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.offset_light_x=(argument0.offset_light_x+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.offset_light_x=(argument0.offset_light_x+1)%BYTE;
                    }
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.offset_light_y=get_integer_c("Light offset Y?", argument0.offset_light_y)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.offset_light_y=(argument0.offset_light_y+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.offset_light_y=(argument0.offset_light_y+1)%BYTE;
                    }
                }
                break;
            case 5:
                if (get_release_a()){
                    argument0.offset_light_z=get_integer_c("Light offset Z?", argument0.offset_light_z)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.offset_light_z=(argument0.offset_light_z+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.offset_light_z=(argument0.offset_light_z+1)%BYTE;
                    }
                }
                break;
            case 6:
                if (get_release_a()){
                    argument0.range_default=get_integer_c("Light range?", argument0.range_default)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.range_default=(argument0.range_default+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.range_default=(argument0.range_default+1)%BYTE;
                    }
                }
                break;
            case 7:
                if (get_release_a()){
                    argument0.range_flicker=get_integer_c("Light range flicker?", argument0.range_flicker)%BYTE;
                }
                if (World.frames%5==0){
                    if (Controller.pleft){
                        argument0.range_flicker=(argument0.range_flicker+BYTE-1)%BYTE;
                    } else if (Controller.pright){
                        argument0.range_flicker=(argument0.range_flicker+1)%BYTE;
                    }
                }
                break;
        }
    }
}
