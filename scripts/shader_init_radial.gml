/// void shader_init_radial();

MOUSE_POS = shader_get_uniform(shd_radial_blur,"mouse_pos");
RESOLUTION = shader_get_uniform(shd_radial_blur,"resolution");
RADIAL_BLUR_OFFSET = shader_get_uniform(shd_radial_blur,"radial_blur_offset");
offset = 0.05;
BRIGHTNESS = shader_get_uniform(shd_radial_blur,"radial_brightness");
brightness = 1;
