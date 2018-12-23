var offset_angle=ternary(handedness==Misc.right, 30, -30);
var offset_z=44;
var offset_distance=24;

var _xrot=0;
var _yrot=10+anim_cast_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level));
var _zrot=180+direction;

var _xoffset=x+offset_distance*dcos(direction-offset_angle);
var _yoffset=y-offset_distance*dsin(direction-offset_angle);
var _zoffset=z-offset_z+EYE_LEVEL;

shader_set(combat_type_weapon_shaders[spell]);
shader_set_uniform_f(shader_get_uniform(combat_type_weapon_shaders[spell], "strength"), 0.5);

var _zoffset2=16;
var m0=matrix_build(0, 0, -_zoffset2, 0, ternary(Camera.pov==CameraPOV.cam_first, pitch/2, 0), 0, 1, 1, 1);
var m1=matrix_build(0, 0, 0, _xrot, _yrot, _zrot, 1, 1, 1);
var m2=matrix_build(_xoffset, _yoffset, _zoffset+_zoffset2, 0, 0, 0, 1, 1, 1);
var mfinal=matrix_multiply(matrix_multiply(m0, m1), m2);
matrix_set(matrix_world, mfinal);

d3d_model_draw_selective_item(equip_weapon_package, equip_weapon);

shader_reset();

// Parameters represent the ball on the staff on the model

var xa=0;
var ya=0;
var za=50;

var array=transform_point_3d(xa, ya, za, _xrot, _yrot, _zrot);

array[vec3.xx]+=_xoffset;
array[vec3.yy]+=_yoffset;
array[vec3.zz]+=_zoffset;

script_execute(combat_type_weapon_effects[spell], array[vec3.xx], array[vec3.yy], array[vec3.zz]);
