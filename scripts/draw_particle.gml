draw_set_transform_stack();
d3d_model_draw(model, 0, 0, 0, texture);
draw_reset_transform_stack();
World.triangles_fx+=144;
World.draw_fx++;

scale*=scalefactor;
