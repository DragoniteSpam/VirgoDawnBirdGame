var s=surface_create(456, 100);
surface_set_target(s);
draw_clear(c_white);
if (file_exists(working_directory+"user\signature.png")){
    // for some reason, the background HAS to exist in order for this to
    // work properly. If it's deleted right after being drawn, it just draws
    // a blank surface. It's not a lot of RAM and only one texture swap, so
    // DON'T DELETE THIS OR I WILL COME TO THE FUTURE AND MURDER YOU.
    if (back!=noone){
        background_delete(back);
    }
    back=background_add(working_directory+"user\signature.png", false, false);
    draw_background(back, 0, 0);
}
surface_reset_target();

return s;
