/// void draw_compass_point(picture, actor);

// floating marker above the ground

var cp=compass_point_pictures[argument0];
d3d_transform_add_translation(-background_get_width(cp)/2, 0, 0);
d3d_transform_add_scaling(0.4, 0.4, 0.4);
d3d_transform_add_rotation_x(90);
d3d_transform_add_rotation_z(90+point_direction(argument1.x, argument1.y, Camera.x, Camera.y));
d3d_transform_add_translation(argument1.x, argument1.y, argument1.z+COMPASS_POINT_HEIGHT);
draw_background(cp, 0, 0);
draw_reset_transform_stack();



