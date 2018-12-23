/// String data_script_template(object);

var xref=W-320;

draw_rectangle_texture_auto_box(xref, 4, "Template", argument0.editor_state==Editor.def, argument0, Editor.def);

draw_rectangle_texture_auto(xref, 64, W-32, 352, true);

if (argument0.editor_state==Editor.def){
    draw_text(xref+16, 80, "x: "+string(argument0.x));
    draw_text(xref+16, 96, "y: "+string(argument0.y));
    draw_text(xref+16, 112, "z: "+string(argument0.z));
    draw_text(xref+16, 128, "xrot: "+string(argument0.xrot));
    draw_text(xref+16, 144, "yrot: "+string(argument0.yrot));
    draw_text(xref+16, 160, "zrot: "+string(argument0.direction));
    draw_text(xref+16, 176, "Snap to grid: "+string(World.edit_snap));
    draw_text(xref+16, 192, "Set");
    
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=(MOUSE_Y-72) div 16;
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        if (get_release_a()){
            switch (m){
                case 0:
                    argument0.x=get_real_c("X coordinate", argument0.x);
                    editor_apply_transformation();
                    break;
                case 1:
                    argument0.y=get_real_c("Y coordinate", argument0.y);
                    editor_apply_transformation();
                    break;
                case 2:
                    argument0.z=get_real_c("Z coordinate", argument0.z);
                    editor_apply_transformation();
                    break;
                case 3:
                    argument0.xrot=get_real_c("Direction", argument0.xrot);
                    editor_apply_transformation();
                    break;
                case 4:
                    argument0.yrot=get_real_c("Direction", argument0.yrot);
                    editor_apply_transformation();
                    break;
                case 5:
                    argument0.direction=get_real_c("Direction", argument0.direction);
                    editor_apply_transformation();
                    break;
                case 6:
                    World.edit_snap=get_real_c("Snap objects to a grid of (0 to turn it off):", World.edit_snap);
                    break;
                case 7:
                    editor_object_template_split(argument0);
                    break;
            }
        }
    }
}
