/// void editor_rotate_ccw(axis (enum));

switch (argument0){
    case Misc.rotate_axis_x:
        selected.xrot=(selected.xrot+1)%360;
        break;
    case Misc.rotate_axis_y:
        selected.yrot=(selected.yrot+1)%360;
        break;
    case Misc.rotate_axis_z:
    default:
        selected.direction=(selected.direction+1)%360;
        break;
}
