/// double object_distance_3d(object1, object2);

if (!instance_exists(argument1)){
    return noone;
}

return point_distance_3d(argument0.x, argument0.y, argument0.z,
    argument1.x, argument1.y, argument1.z);
