/// void draw_health_unit(x, y, radius, relative health);

var steps=BASE_HP_FACTOR;

draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(argument0, argument1, c_white, 1);
for (var i=0; i<=steps; i++){
    if (i<=argument3){
        draw_vertex_colour(argument0+argument2*dcos(i*360/steps), argument1-argument2*dsin(i*360/steps), c_hp, 1);
    }
}
draw_primitive_end();

draw_primitive_begin(pr_linelist);
for (var i=0; i<=steps; i++){
    draw_vertex_colour(argument0, argument1, c_black, 1);
    draw_vertex_colour(argument0+argument2*dcos(i*360/steps), argument1-argument2*dsin(i*360/steps), c_black, 1);
}
draw_primitive_end();
//        draw_sprite(spr_flight_meter_ring, 0, xx, yy);
