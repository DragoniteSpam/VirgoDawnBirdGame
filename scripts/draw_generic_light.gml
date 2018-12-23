/// Entity.draw_generic_light();

if (argument_count==0){
    draw_model(tex_default, false, mod_package, model, model_index);
    if (lit){
        add_to_light();
    }
} else {
    draw_model(argument[0]);
}
