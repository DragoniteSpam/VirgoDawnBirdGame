/// String data_script_npc_walls(object);

var xref=W-320;

draw_rectangle_texture_auto_box(xref+160, 32, "NPC Walls", argument0.editor_state==Editor.npc_walls, argument0, Editor.npc_walls);

data_script_npc(argument0);

if (argument0.editor_state==Editor.npc_walls){
    draw_text(xref+16, 80, "Stun Speed: "+string(argument0.stun_speed));
    draw_text(xref+16, 96, "Return Image: "+background_get_name(all_npc_images[argument0.image]))

    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 1);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.stun_speed=get_real("The (positive) speed required for this NPC to be stunned upon hitting the ground?", argument0.stun_speed);
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.return_image=get_npc_image_from_name(get_string_c("Image?", background_get_name(all_npc_images[argument0.return_image])), argument0.return_image);
                }
                var length=array_length_1d(all_npc_images);
                if (Controller.release_pleft){
                    argument0.return_image=(--argument0.return_image+length)%length;
                } else if (Controller.release_pright){
                    argument0.return_image=++argument0.return_image%length;
                }
                break;
        }
    }
}
