/// void scr_place_at_me(ArgSet);
/* Causes an NPC to stop moving.
 * syntax (in the const_npc thing):
 *   - Package: the package of the thing to move
 *   - Entity: the thing to move
 *   - Package: the package of the thing to move to
 *   - Entity: the thing to move to
 *   - [boolean align]: aligns the direction to that of the target
 *   - [float offsetX]: the x offset
 *   - [float offsetY]: the y offset
 *   - [float offsetZ]: the z offset
 */

var actor_source=ds_map_find_value(all_mod_packages, argument0[| 1].value).my_npcs[argument0[| 1].value].actor;
var actor_destination=ds_map_find_value(all_mod_packages, argument0[| 2].value).my_npcs[argument0[| 3].value].actor;
var align_direction=false;
var offsetx=0;
var offsety=0;
var offsetz=0;

switch (ds_list_size(argument0.a)){
    case 8:
        offsetx=argument0.a[| 5];
        offsety=argument0.a[| 6];
        offsetz=argument0.a[| 7];
    case 5:
        align_direction=argument0.a[| 4];
}

actor_source.x=actor_destination.x+offsetx;
actor_source.y=actor_destination.y+offsety;
actor_source.z=actor_destination.z+offsetz;

if (align_direction){
    actor_source.direction=actor_destination.direction;
}

World.keep_going=true;
