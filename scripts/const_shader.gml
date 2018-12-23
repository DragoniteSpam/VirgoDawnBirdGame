/// void const_shader();

enum Shaders {
    none,
    bc,
    crt,
    emboss,
    grayscale,
    invert,
    led,
    magnify,
    mosaic,
    poster,
    radial,
    ray,
    ripple,
    scanline,
    sepia,
    shockwave,
    sketch,
    thermal,
    vignette,
    wave,
}

globalvar all_shaders;

all_shades=array_add(Shaders.wave);

/*
 * "shader_init_*" scripts should handle the initialization of variables for the shaders - open one up for more details.
 * "shader_code_*" scripts should handle the setting of the shaders, updating the variables, etc.
 */

all_shaders[Shaders.none]=add_shader("Default", shader_init_default, shader_code_default);
all_shaders[Shaders.bc]=add_shader("Brightness/Contrast", shader_init_bc, shader_code_bc);
all_shaders[Shaders.crt]=add_shader("CRT Effect", shader_init_crt, shader_code_crt);
all_shaders[Shaders.emboss]=add_shader("Emboss", shader_init_emboss, shader_code_emboss);
all_shaders[Shaders.grayscale]=add_shader("Grayscale", shader_init_grayscale, shader_code_grayscale);
all_shaders[Shaders.invert]=add_shader("Invert", shader_init_invert, shader_code_invert);
all_shaders[Shaders.led]=add_shader("LED", shader_init_led, shader_code_led);
all_shaders[Shaders.magnify]=add_shader("Magnify", shader_init_magnify, shader_code_magnify);
all_shaders[Shaders.mosaic]=add_shader("Mosaic", shader_init_mosaic, shader_code_mosaic);
all_shaders[Shaders.poster]=add_shader("Posterize", shader_init_poster, shader_code_poster);
all_shaders[Shaders.radial]=add_shader("Radial Blur", shader_init_radial, shader_code_radial);
all_shaders[Shaders.ripple]=add_shader("Ripple", shader_init_ripple, shader_code_ripple);
all_shaders[Shaders.ray]=add_shader("Raytrace", shader_init_ray, shader_code_ray);
all_shaders[Shaders.scanline]=add_shader("Scan Lines", shader_init_scan, shader_code_scan);
all_shaders[Shaders.sepia]=add_shader("Sepia", shader_init_sepia, shader_code_sepia);
all_shaders[Shaders.shockwave]=add_shader("Shockwave", shader_init_shock, shader_code_shock);
all_shaders[Shaders.sketch]=add_shader("Sketch", shader_init_sketch, shader_code_sketch);
all_shaders[Shaders.thermal]=add_shader("Thermal", shader_init_thermal, shader_code_thermal);
all_shaders[Shaders.vignette]=add_shader("Vignette", shader_init_vignette, shader_code_vignette);
all_shaders[Shaders.wave]=add_shader("Wave", shader_init_wave, shader_code_wave);

shd_uniform_outline_size=shader_get_uniform(shd_vertex_outline, "outline_size");
shd_uniform_mvp_mat=shader_get_uniform(shd_vertex_outline, "mvp_mat");
