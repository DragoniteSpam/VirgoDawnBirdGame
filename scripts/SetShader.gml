/// reflexive SetShader(shader index);

instance_deactivate_object(World.active_shader);
World.active_shader=all_shaders[argument0];
World.active_shader.index=argument0;
instance_activate_object(World.active_shader);

return argument0;
