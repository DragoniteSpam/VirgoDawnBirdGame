/// void Entity.draw_model_flag([texture, show hidden items?]);

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}
var d=direction;
direction=lm.direction+5*dsin((lm.intensity/2*(World.frames+x+y+z))%360);
draw_set_transform_stack();
d3d_model_draw(get_model(), 0, 0, 0, t);
draw_reset_transform_stack();
direction=d;
