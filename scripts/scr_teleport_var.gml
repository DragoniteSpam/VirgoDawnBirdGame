/// void scr_teleport_var(ArgSet);
/* proceeds (searches) forwards to the specified keyword 
 * Arguments:
 *   (none)
 */

var new_map=ds_map_find_value(all_mod_packages, var_map_package).my_maps[var_map];
var temp_marker=var_marker;
if (new_map!=lm){
    Player.cutscene_index=World.cutscene.cutscene_index;
//    Player.scene_index=World.cutscene.scene_index;
    World.cutscene=Player.id;
    game_map_enter(var_map_package, var_map);
}

Player.x=teleport_spots[# var_marker, 1];
Player.y=teleport_spots[# var_marker, 2];
Player.z=teleport_spots[# var_marker, 3];
Player.direction=teleport_spots[# var_marker, 4];
Camera.direction=Player.direction;

with (Player){
    set_last_land();
}

Camera.pitch=0;

// I don't know why this is necessary but it is.
// Don't delete it.
register(Player.id, BASE_ASSET, NPCs.ActivePlayer);

World.keep_going=true;
