/// land_translate(who);

var old_x=argument0.x;
var old_y=argument0.y;

var distance_to_origin=point_distance(x, y, argument0.x, argument0.y);
var angle_to_origin=point_direction(x, y, argument0.x, argument0.y);

angle_to_origin=(angle_to_origin+delta_theta+360)%360;

var new_x=x+distance_to_origin*dcos(angle_to_origin);
var new_y=y-distance_to_origin*dsin(angle_to_origin);

var dx=new_x-old_x;
var dy=new_y-old_y;

c_object_set_mask(object, 0, 0);

// This sucks because it only accounts for z rotation (direction)

if (c_overlap_world_position(argument0.object, argument0.x+dx, argument0.y+dy, argument0.z)==0){
    argument0.x=argument0.x+dx;
    argument0.y=argument0.y+dy;
    argument0.direction=argument0.direction+delta_theta;
    if (Camera.hook.id==argument0.id){
        Camera.direction=Camera.direction+delta_theta;
    }
}

c_object_set_mask(object, mask, mask);
