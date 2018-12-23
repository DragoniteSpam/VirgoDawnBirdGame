var offset_angle=ternary(handedness==Misc.right, 75, -75);
var offset_z=0//-(anim_cast_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level)));
var offset_distance=8;
var offset_scale_factor=20;

//var _yrot=10+anim_cast_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level));
var _xrot=120-min(offset_scale_factor*anim_cast_scale*dsin(min(anim_cast_t, 90)), 165)-anim_cast_t;
var _yrot=0;
var _zrot=270+direction+ternary(handedness==Misc.right, 10, -10);

var _xoffset=x+offset_distance*dcos(direction-offset_angle);
var _yoffset=y-offset_distance*dsin(direction-offset_angle);
var _zoffset=z-offset_z+EYE_LEVEL;

if (anim_cast_t>10&&Camera.pov==CameraPOV.cam_first){ // :X
    var m1=matrix_build(0, 0, 0, _xrot, _yrot, _zrot, 1, 1, 1);
    var m2=matrix_build(_xoffset, _yoffset, _zoffset, 0, 0, 0, 1, 1, 1);
    matrix_set(matrix_world, matrix_multiply(m1, m2));
    
    d3d_model_draw_selective(ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_viing].model_array[0], 0, 0, 0, tex_default, BASE_ASSET, World.mdl_viing);
    
    draw_reset_transform_stack();
}
