d3d_transform_add_scaling(scale, scale, scale);
d3d_transform_add_rotation_z(direction);
d3d_transform_add_translation(x, y, z);
draw_sprite_ext(sprite_index, image_index, 0, 0, 1, 1, 0, c_white, min(1, timer/30));
draw_reset_transform_stack();
World.triangles_fx+=2;
World.draw_fx++;
