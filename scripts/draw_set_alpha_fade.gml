/// reflexive boolean draw_set_alpha_fade(fade?);

if (argument0){
    draw_set_alpha(FADE_ALPHA);
} else {
    draw_set_alpha(true);
}

return argument0;
