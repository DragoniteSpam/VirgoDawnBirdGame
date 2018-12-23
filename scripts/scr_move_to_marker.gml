/// void scr_move_to_marker(ArgSet);
/* moves to a marker
 * syntax (in the const_npc thing):
 *   - Package: the package of the thing to move
 *   - Entity: the thing to move
 *   - Package: the package of the thing to move to
 *   - Entity: the thing to move to
 */

var actor=ds_map_find_value(all_mod_packages, argument0[| 1].value).my_npcs[argument0[| 1].value].actor;
var target_actor=ds_map_find_value(all_mod_packages, argument0[| 2].value).my_npcs[argument0[| 3].value].actor;

if (instance_exists(target_actor)&&instance_exists(actor)){
    actor.x=target_actor.x;
    actor.y=target_actor.y;
    actor.z=target_actor.z;
    actor.direction=target_actor.direction;
    
    if (actor.object!=noone){
        CollisionObjectTransform(actor);
    }
}

World.keep_going=true;
