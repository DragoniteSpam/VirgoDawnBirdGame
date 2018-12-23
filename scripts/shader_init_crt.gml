/// void shader_init_bc();

samp_CRT = shader_get_sampler_index(shd_crt, "samp_CRT");

textureBaseSize = shader_get_uniform(shd_crt, "textureBaseSize");
textureScaledSize = shader_get_uniform(shd_crt, "textureScaledSize");
distortion = shader_get_uniform(shd_crt, "distortion");

var_distortion_amount = 0.32;
