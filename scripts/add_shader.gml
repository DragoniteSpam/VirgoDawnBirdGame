/// ShaderWrapper add_shader(name, init script, runtime script);

// the init script is executed here, but it's stored away for later
// in case the shader needs to be reset for some reason

with (instantiate(ShaderWrapper)){
    name=argument0;
    init=argument1;
    code=argument2;
    
    script_execute(init);
    
    return id;
}
