/// void scr_sys_flip_vertical(ArgSet);
/* It does exactly what it sounds like it does.
 */

var catch=argument0;

World.world_v_flip=!World.world_v_flip;

World.keep_going=true;
