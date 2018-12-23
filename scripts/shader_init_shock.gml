/// void shader_init_shock();

TIME = shader_get_uniform(shd_shockwave,"time");
time = 0;
MOUSE_POS = shader_get_uniform(shd_shockwave,"mouse_pos");
RESOLUTION = shader_get_uniform(shd_shockwave,"resolution");
AMPLITUDE = shader_get_uniform(shd_shockwave,"shock_amplitude");
amplitude = 10;
REFRACTION = shader_get_uniform(shd_shockwave,"shock_refraction");
refraction = 0.8;
WIDTH = shader_get_uniform(shd_shockwave,"shock_width");
width = 0.1;
