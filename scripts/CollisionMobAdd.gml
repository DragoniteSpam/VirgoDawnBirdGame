/// object CollisionMobAdd(entity);

with (argument0){
    shape=c_shape_create();
    c_transform_position(0, 0, collision_h);
    c_shape_add_cylinder(shape, collision_r, collision_r, collision_h);
    c_transform_identity();
    object=c_object_create(shape, mask, mask);
    c_object_set_userid(object, id);
    c_world_add_object(object);
    CollisionObjectTransform(id);
    return object;
}
