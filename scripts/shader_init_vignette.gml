/// void shader_init_vignette();

SETTINGS = shader_get_uniform(shd_vignette_noise, "u_settings");
VCOLOR = shader_get_uniform(shd_vignette_noise, "u_vignette_colour");

CIRCLE_INNER_SIZE=1.2;
CIRCLE_OUTER_SIZE=1.9
NOISE_STRENGTH=0.06;
NOISE_ENABLE=true;
