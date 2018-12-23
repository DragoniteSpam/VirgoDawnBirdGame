/// void shader_code_poster(ShaderWrapper);

shader_set(shd_posterization);

with (argument0){
    shader_set_uniform_f(GAMMA, gamma);
    shader_set_uniform_f(NUMBER, number);
}
