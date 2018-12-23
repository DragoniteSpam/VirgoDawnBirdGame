/// void Entity.draw_wrecking_ball([texture]);

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

var hr=272;
var vr=656;

draw_model(t);

d3d_primitive_begin(pr_linelist);
d3d_vertex(x+hr*dcos(ball_direction), y-hr*dcos(ball_direction), z+vr);
d3d_vertex(x+hr*dcos(ball_direction), y-hr*dcos(ball_direction), z+vr-chain_length);
d3d_primitive_end();

matrix_set(matrix_world, matrix_multiply(matrix_build(x+hr*dcos(ball_direction), y-hr*dcos(ball_direction), z+vr-chain_length,
    xrot, yrot, direction, scale, scale, scale), matrix_get(matrix_world)));
draw_model(t, false, Models.gen_wrecking_ball, 0);
World.draw_calls++;
draw_reset_transform_stack();
