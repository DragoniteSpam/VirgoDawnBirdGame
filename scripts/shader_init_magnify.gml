/// void shader_init_magnify();

MOUSE_POS = shader_get_uniform(shd_magnify,"mouse_pos");
RESOLUTION = shader_get_uniform(shd_magnify,"resolution");
RADIUS = shader_get_uniform(shd_magnify,"circleRadius");
radius = 0.25; //higher = more waves
ZOOM_MIN = shader_get_uniform(shd_magnify,"minZoom");
zoom_min = 0.4; //higher = less distortion
ZOOM_MAX = shader_get_uniform(shd_magnify,"maxZoom");
zoom_max = 0.6; //higher = faster
