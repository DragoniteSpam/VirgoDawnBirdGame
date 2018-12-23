/// void draw_effect_light();

// Meant to be drawn all in series.

d3d_transform_set_rotation_x(90);
d3d_transform_add_rotation_z(270+point_direction(Camera.x, Camera.y, x, y));
d3d_transform_add_translation(x+offset_light_x, y+offset_light_y, z+offset_light_z);

if (oscillating_light){
    var r=random_range(-0.15, 0.15);
} else {
    var r=0;
}
var alpha=0.5+dsin(2*World.frames)/4;
draw_sprite_ext(spr_light_ring, 0, 0, 0, 0.5+r, 0.5+r, 0, c_yellow, alpha);
