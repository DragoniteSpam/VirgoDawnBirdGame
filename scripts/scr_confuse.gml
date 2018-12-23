/// void scr_confuse(ArgSet);
/* Applies the "confused" state to an entity.
 * Arguments:
 *   - double time: the number of seconds for the confusion to last
 */

var confusion=create_confusion(x, y, z+16, id);
confusion.timer=eval(argument0[| 0].value)*room_speed;
ds_list_add(attached_particles, confusion);

World.keep_going=true;
