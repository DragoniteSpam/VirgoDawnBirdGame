/// boolean validate_camera_plane(string);

if (!string_starts_with(argument0, "CameraPlanes.")){
    return false;
}

var str=string_replace(argument0, "CameraPlanes.", "");

return (get_camera_plane_from_name(str, -1)!=-1);
