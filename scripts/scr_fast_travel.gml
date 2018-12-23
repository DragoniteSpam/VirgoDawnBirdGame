/// void scr_teleport(ArgSet);
/* teleports the player to somewhere
 * syntax:
 *  scr_fast_travel
 */

var fast_travel_location=World.vars[0];

Player.x=fast_travel_location.teleport_x;
Player.y=fast_travel_location.teleport_y;
Player.z=fast_travel_location.teleport_z;
Player.direction=fast_travel_location.teleport_direction;

Camera.x=Player.x;
Camera.y=Player.y;
Camera.z=Player.z;
Camera.direction=Player.direction;

Camera.pitch=0;

World.keep_going=true;
