/// void occlude_me();

//return point_distance_3d(x, y, z, Camera.x, Camera.y, Camera.z)>OCCLUDE_DISTANCE_MIN&&(occlude&&c_raycast_world(x, y, z, Camera.x, Camera.y, Camera.z, COLLISION_PRIMARY))

var distance=48;

return occlude&&abs(z-Camera.z)>distance;
