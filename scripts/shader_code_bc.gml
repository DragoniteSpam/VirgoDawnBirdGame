/// void shader_code_bc(ShaderWrapper);

shader_set(shd_bright_contrast);

with (argument0){
    shader_set_uniform_f(BRIGHTNESS, brightness);
    shader_set_uniform_f(CONTRAST, contrast);
}
