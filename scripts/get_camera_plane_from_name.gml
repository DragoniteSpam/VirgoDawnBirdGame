/// int get_camera_plane_from_name(name, default);

for (var i=0; i<array_length_1d(all_camera_planes); i++){
    if (all_camera_planes[i]==argument0){
        return i;
    }
}

return argument1;
