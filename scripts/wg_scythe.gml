var first_person_player=get_first_person_player();

var offset_angle=ternary(first_person_player, 30, 45);
if (handedness==Misc.left){
    offset_angle=-offset_angle;
}
var offset_z=16-ternary(anim_cast_t>0, 8, 0);
var offset_distance=ternary(first_person_player, 18, 12);

var _xrot=ternary(anim_cast_t>0, -90, 0);
if (handedness==Misc.left){
    _xrot=-_xrot;
}
var f=ds_map_find_value(all_mod_packages, equip_weapon_package).my_items[equip_weapon].weapon_anim_steps/180;
var _yrot=ternary(first_person_player, 10, 25)+f*log10(10+anim_swipe_distance)*anim_strike_scale*dsin(anim_cast_t/f)-anim_cast_scale*min(5, sqrt(charge_level));
var _zrot=180+direction+_yrot/2.5;

var _xoffset=x+offset_distance*dcos(direction-offset_angle);
var _yoffset=y-offset_distance*dsin(direction-offset_angle);
var _zoffset=z-offset_z+EYE_LEVEL;

var _zoffset2=12;
var m0=matrix_build(0, 0, -_zoffset2, 0, ternary(Camera.pov==CameraPOV.cam_first, pitch/2, 0), 0, 1, 1, 1);
var m1=matrix_build(0, 0, 0, _xrot, _yrot, _zrot, 1, 1, 1);
var m2=matrix_build(_xoffset, _yoffset, _zoffset, 0, 0, 0, 1, 1, 1);
matrix_set(matrix_world, matrix_multiply(matrix_multiply(m0, m1), m2));

d3d_model_draw_selective_item(equip_weapon_package, equip_weapon);

draw_reset_transform_stack();
