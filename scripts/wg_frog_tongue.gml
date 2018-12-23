var range=256;
var scale=range*power(dsin(scaleTo(charge_level, 1, 180)), 2);

if (scale>0.1){
    var m1=matrix_build(0, 0, 0, 0, 0, 0, scale, 1, 1);
    var m2=matrix_build(x, y, z+8, 0, -pitch, direction, 1, 1, 1);
    matrix_set(matrix_world, matrix_multiply(m1, m2));
    
    d3d_model_draw_selective_item(equip_weapon_package, equip_weapon);
    
    draw_reset_transform_stack();
}
