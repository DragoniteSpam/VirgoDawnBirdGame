/// void shader_code_wave(ShaderWrapper);

shader_set(shd_wave);

with (argument0){
    shader_set_uniform_f(TIME, time);
    shader_set_uniform_f(AMOUNT, amount);
    shader_set_uniform_f(DISTORTION, distortion);
    shader_set_uniform_f(SPEED, speed);
}
