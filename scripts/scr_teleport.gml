/// void scr_teleport(ArgSet);
/* teleports the player to somewhere
 * Arguments:
 *   - Package mapPackage: the package that the destination map lives in
 *   - Map map: the map to warp to
 *   - double marker: the marker to jump to
 */

var new_map=ds_map_find_value(all_mod_package, argument0[| 0].value).my_maps[argument0[| 1].value];
if (new_map!=lm){
    Player.cutscene_index=World.cutscene.cutscene_index;
    World.cutscene=Player.id;
    game_map_enter(argument0[| 0].value, argument0[| 1].value);
}

var marker=eval(argument0[| 2].value);
Player.x=teleport_spots[# marker, 1];
Player.y=teleport_spots[# marker, 2];
Player.z=teleport_spots[# marker, 3];
Player.direction=teleport_spots[# marker, 4];

Camera.pitch=0;

World.keep_going=true;
