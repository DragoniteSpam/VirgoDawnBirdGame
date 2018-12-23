/// void scr_teleport_to_me(ArgSet);
/* teleports the player to something, probably a teleport stone
 * Arguments:
 *   (none)
 */

var dir=random(360);
var dist=64;

Player.x=x+dist*dcos(dir);
Player.y=y-dist*dsin(dir);
Player.z=z;

Camera.pitch=0;

World.keep_going=true;
