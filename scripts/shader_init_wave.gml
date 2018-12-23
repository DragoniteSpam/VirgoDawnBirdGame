/// void shader_init_wave();

TIME = shader_get_uniform(shd_wave,"time");
time = 0;
AMOUNT = shader_get_uniform(shd_wave,"wave_amount");
amount = 20; //higher = more waves
DISTORTION = shader_get_uniform(shd_wave,"wave_distortion");
distortion = 30; //higher = less distortion
SPEED = shader_get_uniform(shd_wave,"wave_speed");
speed = 2.0; //higher = faster
