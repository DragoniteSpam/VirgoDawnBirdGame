/// void scr_goto(ArgSet);
/* proceeds (searches) forwards to the specified keyword 
 * Arguments:
 *   - String keyword: the keyword to jump to
 */

if (ds_map_exists(World.cutscene_jump_map, argument0[| 0].value)){
    scene_index=World.cutscene_jump_map[? argument0[| 0].value];
} else {
    print('Not found in this cutscene: '+argument0[| 0].value);
}

World.keep_going=true;
