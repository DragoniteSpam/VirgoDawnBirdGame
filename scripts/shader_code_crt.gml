/// void shader_code_crt(ShaderWrapper);

shader_set(shd_crt);
// @todo listeners for values

with (argument0){
    texture_set_stage(samp_CRT, surface_get_texture(application_surface));
    
    var sw=surface_get_width(application_surface);
    var sh=surface_get_height(application_surface);
    
    shader_set_uniform_f(textureBaseSize, sw, sh);
    shader_set_uniform_f(textureScaledSize, sw, sh);
    shader_set_uniform_f(distortion, var_distortion_amount);
}
