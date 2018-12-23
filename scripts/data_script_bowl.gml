/// String data_script_bowl(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Bowl", argument0.editor_state==Editor.bowl, argument0, Editor.bowl);

data_script_entity(argument0);

if (argument0.editor_state==Editor.bowl){
    switch (argument0.state){
        case Misc.empty:
            draw_text(xref+16, 80, "State: Empty");
            break;
        case Misc.feed:
            draw_text(xref+16, 80, "State: Feed");
            break;
        case Misc.water:
            draw_text(xref+16, 80, "State: Water");
            break;
    }
    switch (argument0.fill){
        case Misc.empty:
            draw_text(xref+16, 96, "Fill: Empty");
            break;
        case Misc.feed:
            draw_text(xref+16, 96, "Fill: Feed");
            break;
        case Misc.water:
            draw_text(xref+16, 96, "Fill: Water");
            break;
    }
    switch (argument0.size){
        case Misc.small:
            draw_text(xref+16, 112, "Size: Small");
            break;
        case Misc.large:
            draw_text(xref+16, 112, "Size: Large");
            break;
    }
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 2);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()){
                    switch (argument0.state){
                        case Misc.empty:
                            argument0.state=Misc.feed;
                            break;
                        case Misc.feed:
                            argument0.state=Misc.water;
                            break;
                        case Misc.water:
                            argument0.state=Misc.empty;
                            break;
                    }
                }
                break;
            case 1:
                if (get_release_a()){
                    switch (argument0.fill){
                        case Misc.empty:
                            argument0.fill=Misc.feed;
                            break;
                        case Misc.feed:
                            argument0.fill=Misc.water;
                            break;
                        case Misc.water:
                            argument0.fill=Misc.empty;
                            break;
                    }
                }
                break;
            case 2:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    if (argument0.size==Misc.large){
                        argument0.size=Misc.small;
                    } else {
                        argument0.size=Misc.large;
                    }
                }
                break;
        }
    }
}
