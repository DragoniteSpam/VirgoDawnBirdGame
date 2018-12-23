/// void scr_camera_lock_onto_actor(ArgSet);
/* causes the camera to lock onto a specified target
 * Arguments:
 *   - NPC target
 *  scr_camera_lock_onto_actor, NPC
 */

Camera.hook_to=argument0[| 0].value;

World.keep_going=false;
