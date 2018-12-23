/// void shader_code_sepia(ShaderWrapper);

shader_set(shd_sketch);

with (argument0){
    shader_set_uniform_f(RESOLUTION, W, H);
    shader_set_uniform_f(INTENSITY, intensity);
}
