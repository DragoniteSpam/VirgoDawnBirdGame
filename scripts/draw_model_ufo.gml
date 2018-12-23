/// void Entity.draw_model_flag([texture]);

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}
direction=direction+3;;
draw_model(t);
