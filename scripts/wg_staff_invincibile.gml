var offset_angle=30;
var offset_z=44-(anim_cast_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level)));
var offset_distance=24;

var _xrot=0;
var _yrot=10/*+anim_cast_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level));*/
var _zrot=180+direction;

var _xoffset=x+offset_distance*dcos(direction-offset_angle);
var _yoffset=y-offset_distance*dsin(direction-offset_angle);
var _zoffset=z-offset_z+EYE_LEVEL;

var m1=matrix_build(0, 0, 0, _xrot, _yrot, _zrot, 1, 1, 1);
var m2=matrix_build(_xoffset, _yoffset, _zoffset, 0, 0, 0, 1, 1, 1);
matrix_set(matrix_world, matrix_multiply(m1, m2));

d3d_model_draw(all_models[Models.gen_tool_staff].model_array[0], 0, 0, 0, tex_default);

// Parameters represent the ball on the staff on the model

var xa=0;
var ya=0;
var za=50;

var array=transform_point_3d(xa, ya, za, _xrot, _yrot, _zrot);

array[vec3.xx]+=_xoffset;
array[vec3.yy]+=_yoffset;
array[vec3.zz]+=_zoffset;

we_invincibile(array[vec3.xx], array[vec3.yy], array[vec3.zz]);
