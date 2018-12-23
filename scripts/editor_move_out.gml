/// void editor_move_out();

var d=object_distance_3d(Camera, selected);
var f=min(EDITOR_MAX_DISTANCE, d*1.005)/d;
selected.x=Camera.x+(selected.x-Camera.x)*f;
selected.y=Camera.y+(selected.y-Camera.y)*f;
selected.z=Camera.z+(selected.z-Camera.z)*f;

selected.lerp_target_x=selected.x;
selected.lerp_target_y=selected.y;
selected.lerp_target_z=selected.z;

edit_distance=object_distance_3d(Camera, selected);
