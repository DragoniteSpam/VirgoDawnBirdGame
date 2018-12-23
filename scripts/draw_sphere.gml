/// void draw_sphere(x, y, z, radius, tex);

// sphere model radius is 16

d3d_transform_set_scaling(argument[3]/16, argument[3]/16, argument[3]/16);
d3d_transform_add_translation(argument[0], argument[1], argument[2]);
d3d_model_draw(World.model_sphere, 0, 0, 0, argument[4]);
draw_reset_transform_stack();
