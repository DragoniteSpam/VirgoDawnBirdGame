/// int get_compass_direction(int direction);
// Direction between the camera and the target direction, normalized where Camera.direction = 0
// Range of -180..+180 degrees

var v=(argument0-Camera.direction+360) mod 360;
if (v>180)
    return v-360;

return v;
