/// String data_script_door(object);

var xref=W-320;
draw_rectangle_texture_auto_box(xref, 32, "Chest", argument0.editor_state==Editor.chest, argument0, Editor.chest);

data_script_entity(argument0);

if (argument0.editor_state==Editor.chest){
    draw_text(xref+16, 80, "Random loot? "+tf[argument0.loot_random]);
    draw_text(xref+16, 96, "Looted?"+tf[argument0.looted]);
    if (mouse_within_rectangle(xref, 64, W-32, 352)){
        mouse_over_menu=true;
        var m=clamp((MOUSE_Y-72) div 16, 0, 1);
        draw_rectangle(xref+12, 72+m*16, W-40, 88+m*16, true);
        switch (m){
            case 0:
                if (get_release_a()||Controller.release_left||Controller.release_right){
                    argument0.loot_random=!argument0.loot_random;
                }
                break;
            case 1:
                if (get_release_a()){
                    argument0.looted=!argument0.looted;
                    if (argument0.looted){
                        argument0.state=Misc.open;
                    } else {
                        argument0.state=Misc.closed;
                    }
                }
                break;
            case 2:
/*                var len=2<<32;
                if (get_release_a()){
                    argument0.loot_quantity=get_integer("Quantity:", argument0.loot_quantity);
                } else if (Controller.release_left){
                    argument0.loot_quantity=(--argument0.loot_quantity+len)%len;
                } else if (Controller.release_right){
                    argument0.loot_quantity=++argument0.loot_quantity%len;
                }*/
                break;
        }
    }
}
