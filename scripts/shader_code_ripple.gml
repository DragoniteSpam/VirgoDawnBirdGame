/// void shader_code_ripple(ShaderWrapper);

shader_set(shd_ripple);

with (argument0){
    shader_set_uniform_f(TIME, time);
    shader_set_uniform_f(MOUSE_POS, MOUSE_X, MOUSE_Y);
    shader_set_uniform_f(RESOLUTION, W, H);
    shader_set_uniform_f(AMOUNT, amount);
    shader_set_uniform_f(DISTORTION, distortion);
    shader_set_uniform_f(SPEED, speed);
}
