/// void shader_code_mosaic(ShaderWrapper);

shader_set(shd_mosaic);

with (argument0){
    shader_set_uniform_f(RESOLUTION, W, H);
    shader_set_uniform_f(AMOUNT, amount);
}
