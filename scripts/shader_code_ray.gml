/// void shader_code_ray(ShaderWrapper);

shader_set(shd_ray);

with (argument0){
    shader_set_uniform_f(TIME, current_time/scalar);
}
