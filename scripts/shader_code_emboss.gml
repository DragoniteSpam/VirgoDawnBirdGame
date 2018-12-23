/// void shader_code_emboss(ShaderWrapper);

shader_set(shd_emboss);

with (argument0){
    shader_set_uniform_f(RESOLUTION, W, H);
}
