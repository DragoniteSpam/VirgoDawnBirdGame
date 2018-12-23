/// void editor_floor_object([entity]);

if (argument_count==0){
    var obj=selected;
} else {
    var obj=argument[0];
}

c_world_remove_object(obj.object);

while (!c_raycast_world(obj.x, obj.y, obj.z, obj.x, obj.y, obj.z-1, COLLISION_EVERYTHING)&&obj.z>0){
    obj.z--;
}

obj.lerp_target_z=obj.z;

c_world_add_object(obj.object);

editor_apply_transformation(obj);
