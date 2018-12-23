/// void scr_camera_3d(ArgSet);
/* Sets the camera to normal 3D mode.
 * Arguments:
 *   - None
 */

Camera.pov=Camera.stored_2d_pov;
Player.movement_script=movement_player;

World.keep_going=true;
