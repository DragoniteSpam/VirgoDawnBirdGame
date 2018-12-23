/// void shader_code_vignette(ShaderWrapper);

shader_set(shd_vignette_noise);

with (argument0){
/*    if (Player.soaring){
        CIRCLE_INNER_SIZE=lerp(CIRCLE_INNER_SIZE, 2, 0.05);
    } else {
        CIRCLE_INNER_SIZE=lerp(CIRCLE_INNER_SIZE, 5, 0.05);
    }
    CIRCLE_OUTER_SIZE=CIRCLE_INNER_SIZE*1.5;*/
    shader_set_uniform_f(SETTINGS, CIRCLE_INNER_SIZE, CIRCLE_OUTER_SIZE, NOISE_STRENGTH, NOISE_ENABLE);
     //vignette inner circle size, vignette outter circle size, noise strength, noise enable (1 or 0 only, currently disabled).
    shader_set_uniform_f(VCOLOR, 127, 127, 127); //R,G,B - 0 to 255
}
