/// void scr_move_to(ArgSet);
/* moves you to something
 * Arguments
 *   - double x: the x coordinate to move to
 *   - double y: the y coordinate to move to
 *   - double z: the z coordinate to move to
 *   - [double direction]: the direction to face
 */

x=eval(argument0[| 1].value);
y=eval(argument0[| 2].value);
z=eval(argument0[| 3].value);

if (ds_list_size(argument0)>4){
    direction=eval(argument0[| 4].value);
}

if (object!=noone){
    CollisionObjectTransform(id);
}

World.keep_going=true;
