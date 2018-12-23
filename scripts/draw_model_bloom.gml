/// void Entity.draw_model_bloom([texture]);

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

// This is INCREDIBLY hacky but it'll (probably) look somewhat good.
scale=lerp(scale, 1, 0.4);
draw_model_flag(t);
