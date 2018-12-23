// Compass directions
enum Directions {
    east=0,
    northeast=45,
    north=90,
    northwest=135,
    west=180,
    southwest=225,
    south=270,
    southeast=315
}

enum CameraPlanes {
    xaxis,
    yaxis,
}

globalvar all_camera_planes;

all_camera_planes[CameraPlanes.yaxis]="YAxis";
all_camera_planes[CameraPlanes.xaxis]="XAxis";
