if (Camera.pov!=CameraPOV.cam_first&&mode==GameModes.play/*&&Player.class!=Classes.Person*/){
    walking_animation=true;
    if (Player.below_location_flag==LocationFlags.no){  // if is flying
        image=get_class(Player.id).image_flying;
        if (z>zprevious||frame!=0){
            is_animating=true;
        } else {
            is_animating=false;
        }
    } else if (Player.below_location_flag==LocationFlags.water){    // if is swimming
        image=get_class(Player.id).image_swimming;
        if (x==xprevious&&y==yprevious){
            is_animating=false;
            frame=0;
        } else {
            is_animating=true;
        }
    } else {        // if is walking
        image=get_class(Player.id).image;
        if (x==xprevious&&y==yprevious){
            is_animating=false;
            frame=0;
        } else {
            is_animating=true;
        }
    }
    with (World){
        set_lighting(false);
    }
    draw_npc(image);
    with (World){
        set_lighting(true);
    }
}
