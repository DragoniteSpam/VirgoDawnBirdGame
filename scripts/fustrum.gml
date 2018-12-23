/// boolean fustrum(x, y);

var angle_test=point_direction(Camera.x, Camera.y, argument[0], argument[1]);
var angle=Camera.direction;
var angle_front=angle+fov+20+Camera.active_fova;
var angle_back=angle-fov-20-Camera.active_fova;
if (!(angle-fov>=0&&angle+fov<360)){
    angle_test=(angle_test+180)%360;
    angle_front=(angle_front+180)%360;
    angle_back=(angle_back+180)%360;
}

return (angle_test>angle_back&&angle_test<angle_front);
