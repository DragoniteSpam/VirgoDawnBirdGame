d3d_transform_add_rotation_x(90);
d3d_transform_add_rotation_z(90);
d3d_transform_add_rotation_z(180+point_direction(Camera.x, Camera.y, x, y));
d3d_transform_add_translation(x, y, z);
draw_background_ext(sprite_index, 0, 0, scale, scale, 0, c_white, alpha);
draw_reset_transform_stack();
World.triangles_fx+=2;
World.draw_fx++;

scale=scale*scalefactor;
alpha=alpha*alphafactor;
