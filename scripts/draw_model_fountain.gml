/// void Entity.draw_model_fountain([texture, show hidden items?]);

// draw the dish
if (show_visible_model){
    if (argument_count>0){
        var t=argument[0];
    } else {
        var t=tex_default;
    }
    draw_set_transform_stack();
    d3d_model_draw(get_model(), 0, 0, 0, t);
    draw_reset_transform_stack();
}

// this is rather expensive
var f=splashiness/16;
repeat((global_particle_density div 128)+2){
    create_particle(RANDOM_PARTICLE_WATER, x, y, z+16, -30*f, -30*f, 90*f, 30*f, 30*f, 240*f, 1.5, 300, 0, 0, c_gravity);
}
