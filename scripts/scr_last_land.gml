/// void scr_last_land(ArgSet);
/* Returns the player to last land.
 * Arguments:
 *   (none)
 */

var catch=argument0;

with (Player){
    x=last_land_x;
    y=last_land_y;
    z=last_land_z;
    direction=last_land_direction;
    Camera.direction=direction;
}

World.keep_going=true;
