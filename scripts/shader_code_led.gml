/// void shader_code_led(ShaderWrapper);

shader_set(shd_LED);

with (argument0){
    shader_set_uniform_f(RESOLUTION, W, H);
    shader_set_uniform_f(SIZE, size);
    shader_set_uniform_f(BRIGHTNESS, brightness);
}
