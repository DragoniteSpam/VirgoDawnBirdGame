/// void scr_camera_2d(ArgSet);
/* Sets the camera to fake-2D mode.
 * Arguments:
 *   - CameraPlane plane: the plane of the camera
 */

Camera.stored_2d_pov=Camera.pov;
Camera.pov=CameraPOV.cam_2d;
Camera.plane_2d=argument0[| 0].value;
Player.movement_script=movement_player_2D;

World.keep_going=true;
