/// void shader_code_radial(ShaderWrapper);

shader_set(shd_radial_blur);

with (argument0){
    shader_set_uniform_f(MOUSE_POS, MOUSE_X, MOUSE_Y);
    shader_set_uniform_f(RESOLUTION, H, W);
    shader_set_uniform_f(RADIAL_BLUR_OFFSET, offset);
    shader_set_uniform_f(BRIGHTNESS, brightness);
}
