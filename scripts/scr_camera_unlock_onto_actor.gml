/// void scr_camera_unlock_onto_actor(ArgSet);
/* causes the camera to lock onto a specified target
 * Arguments:
 *   - None
 */

Player.direction=point_direction(Player.x, Player.y, Camera.hook_to.x, Camera.hook_to.y);
//Camera.pitch=darctan((Camera.hook_to.z-Player.z)/point_distance(Player.x, Player.y, Camera.hook_to.x, Camera.hook_to.y));
//Camera.pitch=0;

Camera.hook_to=noone;

World.keep_going=false;
