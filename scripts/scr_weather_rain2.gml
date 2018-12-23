scr_weather_process();

d3d_transform_set_rotation_y(10);
d3d_transform_add_rotation_x(10);
d3d_transform_add_translation(Camera.x+2*(frames%128), Camera.y-2*(frames%128), Player.z-8*(frames%32));
d3d_model_draw(model_rain, 0, 0, 0, tex_atmosphere);
d3d_model_draw(model_rain, 0, 0, 512, tex_atmosphere);
draw_reset_transform_stack();

