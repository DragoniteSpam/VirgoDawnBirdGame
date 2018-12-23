/// Entity.draw_model_lamp();

if (argument_count==0){
    if (is_clamped(game_current_hour, 6, 18)&&!lm.is_indoors){
        draw_model(tex_default, false, mod_package, model, 0);
    } else {
        set_fog(false);
        draw_model(tex_default, false, mod_package, model, 1);
        set_fog(true);
        add_to_light();
    }
} else {
    draw_model(argument[0]);
}
