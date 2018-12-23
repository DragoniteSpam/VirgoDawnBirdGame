/// object CollisionObjectAdd(entity);

with (argument0){
    shape=get_model_object().shape;
    object=c_object_create(shape, mask, mask);
    c_object_set_userid(object, id);
    c_world_add_object(object);
    CollisionObjectTransform(id);
    return object;
}
