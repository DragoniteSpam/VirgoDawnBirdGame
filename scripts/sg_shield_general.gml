/// void sg_shield_general(mod package, model);

if (get_first_person_player()){
    var offset_angle=ternary(handedness==Misc.right, -36, 36);
    var offset_z=16;
    var offset_distance=16;
} else {    // for NPCs
    var offset_angle=ternary(handedness==Misc.right, -30, 30);
    var offset_z=24;
    var offset_distance=8;
}

var _xrot=0;
var _yrot=10;//+anim_cast_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level));
var _zrot=direction;

var _xoffset=x+offset_distance*dcos(direction-offset_angle);
var _yoffset=y-offset_distance*dsin(direction-offset_angle);
var _zoffset=z-offset_z+EYE_LEVEL;

var m1=matrix_build(0, 0, 0, _xrot, _yrot, _zrot, 0.5, 0.5, 0.5);
var m2=matrix_build(_xoffset, _yoffset, _zoffset, 0, 0, 0, 1, 1, 1);

matrix_set(matrix_world, matrix_multiply(m1, m2));

d3d_model_draw_selective(ds_map_find_value(all_mod_packages, argument0).my_models[argument1].model_array[0], 0, 0, 0, tex_default, argument0, argument1);

draw_reset_transform_stack();
