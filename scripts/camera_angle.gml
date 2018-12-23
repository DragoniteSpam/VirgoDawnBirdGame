/// CameraAngle camera_angle(object);
var angle=(((Camera.direction mod 360)-argument0.direction)+360) mod 360;

if (angle<=45||angle>315){
    return CameraAngles.back;
}
if (angle<=135){
    return CameraAngles.side;
}
if (angle<=225){
    return CameraAngles.front;
}

return CameraAngles.side;
