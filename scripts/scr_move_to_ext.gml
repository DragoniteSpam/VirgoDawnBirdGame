/// void scr_move_to_ext(ArgSet);
/* Moves to a location, takes a script as an argument
 *  scr_move_to, Actor index, script
 */

script_execute(argument0.a[| 1], argument0.a[| 0]);

var actor=all_npcs[argument0.a[| 0]].actor;
if (actor!=noone){
    if (actor.object!=noone){
        CollisionObjectTransform(actor);
    }
}

World.keep_going=true;
