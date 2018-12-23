/// boolean within_sight(x, y, [range factor]);

if (!alive&&mode==GameModes.play){
    return false;
}

if (argument_count>3){
    var dist=argument[3]
} else {
    var dist=point_distance(Camera.x, Camera.y, argument[0], argument[1]);
}

// Range factor is tricky - it DIVIDES the CALCULATED DISTANCE by
// a CERTAIN AMOUNT. Therefore, a larger number results in a longer
// render distance.

if (argument_count>2){
    dist/=argument[2];
}

return ((dist<1600)||(dist<render_distance*64)&&fustrum(argument[0], argument[1]));
