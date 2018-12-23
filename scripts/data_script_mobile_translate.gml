/// data_script_card(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Move:Trans", argument0.editor_state==Editor.movement, argument0, Editor.movement);

data_script_entity(argument0);

if (argument0.editor_state==Editor.movement){
    draw_text(xref+16, 80, "Position: "+string(argument0.position));
    draw_text(xref+16, 96, "Speed: "+string_format(argument0.action_speed, 1, 4));
    draw_text(xref+16, 112, "Style: "+interpolation_style_names[argument0.style]);
    draw_text(xref+16, 128, "End Action: "+mobile_end_action_names[argument0.endaction]);
    draw_text(xref+16, 144, "Absolute? "+tf[argument0.absolute]);
    
    draw_text_colour(xref+16, 224, "Keyframes", c_blue, c_blue, c_blue, c_blue, 1);
    var n=ds_list_size(argument0.stages);
    for (var i=argument0.editor_keyframe_n; i<min(argument0.editor_keyframe_limit, n); i++){
        var p=(i-argument0.editor_keyframe_n);
        var keyframe=argument0.stages[| i];
        draw_text(xref+16, 240+16*p, "["+string(i)+"] "+keyframe.name);
        draw_sprite_ext(spr_arrows_8, 1, W-64-32, 240+16*p, 1, 1, 0, c_black, 1);
        draw_sprite_ext(spr_arrows_8, 3, W-64-16, 240+16*p, 1, 1, 0, c_black, 1);
        draw_sprite_ext(spr_x_8, 0, W-64, 240+16*p, 1, 1, 0, c_red, 1);
    }
    draw_text(xref+16, 240+16*i, "Add Keyframe");

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 23);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.position=clamp(get_real("Position on the pathway?", argument0.position), 0, n-1)
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.action_speed=clamp(get_real("Stages per second?", argument0.action_speed), -argument0.editor_speed_limit, argument0.editor_speed_limit);
                }
                break;
            case 2:
                if (get_release_a()){
                    argument0.style=(++argument0.style)%array_length_1d(interpolation_style_names);
                }
                break;
            case 3:
                if (get_release_a()){
                    argument0.endaction=(++argument0.endaction)%array_length_1d(mobile_end_action_names);
                }
                break;
            case 4:
                if (get_release_a()){
                    argument0.absolute=!argument0.absolute;
                }
                break;
            default:
                if (m>=10){
                    var base_sub_x=W-104;
                    var hpos=(MOUSE_X-W+104) div 16;
                    var s=(m-10);
                    if (s<n&&is_clamped(hpos, 0, 2)){
                        draw_rectangle(base_sub_x+16*hpos+1, 73+m*16, base_sub_x+15+16*hpos, 87+m*16, true);
                    }
                    if (get_release_a()){
                        if (s==n){
                            var vec=instantiate(Vector3);
                            if (show_question("Create at camera's position?")){
                                if (argument0.absolute){
                                    vec.x=Camera.x;
                                    vec.y=Camera.y;
                                    vec.z=Camera.z;
                                } else {
                                    vec.x=Camera.x-argument0.x;
                                    vec.y=Camera.y-argument0.y;
                                    vec.z=Camera.z-argument0.z;
                                }
                            } else {
                                show_question("Be sure to set the position!");
                            }
                            ds_list_add(argument0.stages, vec);
                        } else if (s<n){
                            switch (hpos){
                                case 0: // move up
                                    if (s>0){
                                        var vec=argument0.stages[| s];
                                        ds_list_delete(argument0.stages, s);
                                        ds_list_insert(argument0.stages, s-1, vec);
                                    }
                                    break;
                                case 1: // move down
                                    if (s<(n-1)){
                                        var vec=argument0.stages[| s];
                                        ds_list_delete(argument0.stages, s);
                                        ds_list_insert(argument0.stages, s+1, vec);
                                    }
                                    break;
                                case 2: // delete
                                    if (show_question("Delete this keyframe?")){
                                        var vec=argument0.stages[| s];
                                        ds_list_delete(argument0.stages, s);
                                        argument0.position=min(argument0.position, ds_list_size(argument0.stages)-1);
                                        instance_activate_object(vec);
                                        with (vec){
                                            instance_destroy();
                                        }
                                        if (argument0.editor_keyframe_active==s){
                                            argument0.editor_keyframe_active=noone;
                                        }
                                    }
                                    break;
                                default:
                                    argument0.editor_keyframe_active=s;
                                    break;
                            }
                        }
                    }
                }
                break;
        }
    }
    
    if (argument0.editor_keyframe_active!=noone){
        var keyframe=argument0.stages[| argument0.editor_keyframe_active];
        draw_rectangle_texture_auto(xref-320, 64, xref-32, 64+32+112, true);
        draw_text_colour(xref-320+16, 80, "Keyframe "+string(argument0.editor_keyframe_active), c_blue, c_blue, c_blue, c_blue, 1);
        var name_string="Name: "+string(keyframe.name);
        var suffix="";
        while (string_width(name_string)>256){
            suffix="...";
            name_string=string_delete(name_string, string_length(name_string)-1, 1);
        }
        draw_text(xref-320+16, 96, name_string+suffix);
        draw_text(xref-320+16, 112, "x: "+string(keyframe.x));
        draw_text(xref-320+16, 128, "y: "+string(keyframe.y));
        draw_text(xref-320+16, 144, "z: "+string(keyframe.z));
        draw_text(xref-320+16, 160, "Move to Camera");
        draw_text(xref-320+16, 176, "Move to Origin");
        draw_text(xref-320+16, 192, "Align to Grid");
        
        if (mouse_within_rectangle(xref-320, 96, xref-32, 64+32+96)){
            mouse_over_menu=true;
            var m=clamp((MOUSE_Y-104) div 16, 0, 5);
            draw_rectangle(xref+-320+12, 104+m*16, xref-32, 120+m*16, true);
            switch (m){
                case 0:
                    if (get_release_a()){
                        keyframe.x=get_real("X coordinate of this keyframe?", keyframe.x);
                    }
                    break;
                case 1:
                    if (get_release_a()){
                        keyframe.y=get_real("Y coordinate of this keyframe?", keyframe.y);
                    }
                    break;
                case 2:
                    if (get_release_a()){
                        keyframe.z=get_real("Z coordinate of this keyframe?", keyframe.z);
                    }
                    break;
                case 3:
                    if (get_release_a()){
                        if (argument0.absolute){
                            keyframe.x=Camera.x;
                            keyframe.y=Camera.y;
                            keyframe.z=Camera.z;
                        } else {
                            keyframe.x=Camera.x-argument0.x;
                            keyframe.y=Camera.y-argument0.y;
                            keyframe.z=Camera.z-argument0.z;
                        }
                    }
                    break;
                case 4:
                    if (get_release_a()){
                        if (argument0.absolute){
                            keyframe.x=argument0.xstart;
                            keyframe.y=argument0.ystart;
                            keyframe.z=argument0.zstart;
                        } else {
                            keyframe.x=0;
                            keyframe.y=0;
                            keyframe.z=0;
                        }
                    }
                    break;
                case 5:
                    if (get_release_a()&&World.edit_snap>0){
                        var es=World.edit_snap;
                        keyframe.x=(keyframe.x div es)*es;
                        keyframe.y=(keyframe.y div es)*es;
                        keyframe.z=(keyframe.z div es)*es;
                    }
                    break;
            }
        }
    }
}
