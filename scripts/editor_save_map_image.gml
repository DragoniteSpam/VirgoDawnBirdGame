
d3d_set_lighting(false);
d3d_light_define_direction(Misc.camera, 0, 0, -1, c_white);
d3d_set_fog(false, c_white, 0, 1);
d3d_set_projection_perspective(0, 0, lm.w*256, lm.h*256, 0);
d3d_transform_set_scaling(0.25, 0.25, -1);

//d3d_set_projection(lm.w*CELL_SIZE/2, lm.h*CELL_SIZE/2, 8192, lm.w*CELL_SIZE/2, lm.h*CELL_SIZE/2, 0, 0, -1, 0);

var surface=surface_create(lm.w*256, lm.h*256);
surface_set_target(surface);
draw_clear(c_white);

for (var i=0; i<lm.w; i++){
    for (var j=0; j<lm.h; j++){
        d3d_model_draw(lm.terrain_cells[# i, j].model, i*256+128, j*256+128, 0, tex_default);
    }
}

draw_reset_transform_stack();

surface_reset_target();
surface_save(surface, argument0);
surface_free(surface);
