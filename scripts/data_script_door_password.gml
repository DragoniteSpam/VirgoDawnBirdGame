/// String data_script_door_password(object);

var xref=W-160;
draw_rectangle_texture_auto_box(xref, 32, "DoorPSWD", argument0.editor_state==Editor.door_password, argument0, Editor.door_password);

data_script_door(argument0);

if (argument0.editor_state==Editor.door_password){
    draw_text(xref+16, 80, "Password: "+argument0.password);
    
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 0);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    argument0.password=get_string("Password? (Can be a passphrase instead.)", argument0.password);
                }
                break;
        }
    }
}
