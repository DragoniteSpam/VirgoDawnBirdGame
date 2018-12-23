var first_person_player=get_first_person_player();

var offset_angle=ternary(first_person_player, 30, 45);
if (handedness==Misc.left){
    offset_angle=-offset_angle;
}
var offset_z=ternary(first_person_player, 0, 16);
var offset_distance=ternary(first_person_player, 24, 12);

var _xrot=0;
var _yrot=0//ternary(first_person_player, 10, 25)+log10(10+anim_swipe_distance)*anim_strike_scale*dsin(anim_cast_t)-anim_cast_scale*min(5, sqrt(charge_level));
var _zrot=direction+_yrot/2.5;

var _xoffset=x+offset_distance*dcos(direction-offset_angle);
var _yoffset=y-offset_distance*dsin(direction-offset_angle);
var _zoffset=z-offset_z+EYE_LEVEL;

var m1=matrix_build(0, 0, 0, _xrot, _yrot, _zrot, 1, 1, 1);
var m2=matrix_build(_xoffset, _yoffset, _zoffset, 0, 0, 0, 1, 1, 1);
matrix_set(matrix_world, matrix_multiply(m1, m2));

if (charge_level*room_speed>room_speed/4){
    var mi=1;
} else {
    var mi=0;
}

if (id==Player.id){
    if (charge_level>0){
        Camera.archery_fova=max(log2(charge_level*room_speed), 1);
    } else {
        Camera.archery_fova=0;
    }
}

d3d_model_draw_selective_item(equip_weapon_package, equip_weapon);

draw_reset_transform_stack();
