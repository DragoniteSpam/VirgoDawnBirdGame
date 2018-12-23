/// void Event.draw_event_collectable([texture, show hidden items?]);

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

var d=direction;
direction=World.frames;
model=Models.extra_feather;
matrix(x, y, z, xrot, yrot, direction, COLLECTABLE_SCALE, COLLECTABLE_SCALE, COLLECTABLE_SCALE);
d3d_model_draw(get_model(), 0, 0, 0, t);
draw_reset_transform_stack();
direction=d;
