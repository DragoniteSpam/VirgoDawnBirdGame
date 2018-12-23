/// void shader_code_magnify(ShaderWrapper);

shader_set(shd_magnify);

with (argument0){
    shader_set_uniform_f(MOUSE_POS, MOUSE_X, MOUSE_Y);
    shader_set_uniform_f(RESOLUTION, W, H);
    shader_set_uniform_f(RADIUS, radius);
    shader_set_uniform_f(ZOOM_MIN, zoom_min);
    shader_set_uniform_f(ZOOM_MAX, zoom_max);
}
