/// boolean CollisionObjectRaycastMouse(object, [mask, distance]);
// automatically casts a ray of the mouse vector from the object's x, y, z

if (argument_count==1){
    var mask=COLLISION_PRIMARY;
    var d=5;
} else {
    var mask=argument[1];
    var d=argument[2];
}

return c_raycast_world(argument[0].x, argument[0].y, argument[0].z,
    argument[0].x+d*World.mouse_dx, argument[0].y+d*World.mouse_dy,
    argument[0].z+d*World.mouse_dz, mask);
