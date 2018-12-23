/// void shader_code_grayscale(ShaderWrapper);

shader_set(shd_greyscale);

with (argument0){
    // @todo implement a listener for "fade," if necessary
    shader_set_uniform_f(FADE, fade);
}
