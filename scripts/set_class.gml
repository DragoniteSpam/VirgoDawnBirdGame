/// void set_class(class index);

// You may want to do some animation and stuff in here.

Player.class=argument0;
Camera.pov=ternary(argument0==Classes.Person, CameraPOV.cam_first, CameraPOV.cam_third);
/*if (argument0==Classes.Person){
    SetShader(World.shader_stored);
} else {
    World.shader_stored=World.active_shader.index;
    SetShader(Shaders.vignette);
}*/
