/// void editor_rotate_cw(axis (enum));

switch (argument0){
    case Misc.rotate_axis_x:
        selected.xrot=(selected.xrot+359)%360;
        break;
    case Misc.rotate_axis_y:
        selected.yrot=(selected.yrot+359)%360;
        break;
    case Misc.rotate_axis_z:
    default:
        selected.direction=(selected.direction+359)%360;
        break;
}
