#define draw_effect_ball_lightning
World.triangles_fx+=strength*30;    // 60/2
World.draw_fx++;

xprevious=x;
yprevious=y;
zprevious=z;

x=x+move_speed*dcos(direction);
y=y-move_speed*dsin(direction);
z=z-move_speed*dsin(pitch);

matrix_set(matrix_world, matrix_build(x, y, z, 0, 0, 0, 1, 1, 1));

vertex_submit(buffer, pr_linelist, -1);

draw_reset_transform_stack();

if (c_raycast_world(xprevious, yprevious, zprevious, x, y, z, COLLISION_PRIMARY)){
    var obj=CollisionGetObject();
    if (obj!=caster){
        with (obj){
            if (hit_flag_accept(c_hit_x(), c_hit_y())){
                script_execute(all_hit_scripts[on_hit], CombatTypes.electric, other.caster, other.strength);
            } else {
                hit_flag_invalid_response(c_hit_x(), c_hit_y(), c_hit_z());
            }
        }
        instance_destroy();
    }
}

#define draw_effect_ball_lightning_create
var buffer=vertex_create_buffer();
vertex_begin(buffer, World.vertex_format_basic);
repeat(min(strength, MAX_BALL_LIGHTNING_EFFECT_STENGTH)*60*2){
    do {
        var xx=irandom_range(-size, size);
        var yy=irandom_range(-size, size);
        var zz=irandom_range(-size, size);
    } until(point_distance_3d(xx, yy, zz, 0, 0, 0)<size);
    vertex_position_3d(buffer, xx, yy, zz);
    vertex_colour(buffer, c_yellow, 0.75);
}
vertex_end(buffer);

return buffer;