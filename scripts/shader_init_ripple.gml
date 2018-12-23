/// void shader_init_ripple();

TIME = shader_get_uniform(shd_ripple,"time");
time = 0;
MOUSE_POS = shader_get_uniform(shd_ripple,"mouse_pos");
RESOLUTION = shader_get_uniform(shd_ripple,"resolution");
AMOUNT = shader_get_uniform(shd_ripple,"wave_amount");
amount = 80; //higher = more waves
DISTORTION = shader_get_uniform(shd_ripple,"wave_distortion");
distortion = 30; //higher = less distortion
SPEED = shader_get_uniform(shd_ripple,"wave_speed");
speed = 5.0; //higher = faster
