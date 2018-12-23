/// void scr_face(ArgSet);
/* causes an Actor to face a direction
 * Arguments:
 *   - Selectable target: the object to face
 *   - boolean absolute: usually true
 */

if (argument0[| 1].value){
    id.direction=argument0[| 0].value;
} else {
    id.direction=(id.direction+argument0[| 0].value+360)%360;
}

World.keep_going=true;
