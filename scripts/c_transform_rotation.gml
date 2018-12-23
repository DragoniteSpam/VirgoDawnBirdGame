///c_transform_rotation(xrot, yrot, zrot)
/*
Sets the rotation of the transformation in euler angles.
Note: Angles are in degrees. You can easily modify this script to use radians instead.
*/
return external_call(global._c_transform_rotation, degtorad(-argument0), degtorad(-argument1), degtorad(-argument2));
