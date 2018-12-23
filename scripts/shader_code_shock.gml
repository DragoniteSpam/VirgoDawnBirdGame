/// void shader_code_shock(ShaderWrapper);

shader_set(shd_shockwave);

with (argument0){
    time+=0.004;
    shader_set_uniform_f(TIME, time);
    shader_set_uniform_f(MOUSE_POS, MOUSE_X, MOUSE_Y);
    shader_set_uniform_f(RESOLUTION, W, H);
    shader_set_uniform_f(AMPLITUDE, amplitude);
    shader_set_uniform_f(REFRACTION, refraction);
    shader_set_uniform_f(WIDTH, width);
}
