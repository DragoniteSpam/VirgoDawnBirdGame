/// void scr_else(ArgSet);
/* marks the "else" part of an if/else block
 * Arguments:
 *   (none)
 */

var catch=argument0;

var original=cutscene_map[? World.cutscene.cutscene_index].compiled[| World.scene_index-1];
World.scene_index=original.closed.line_number;

World.keep_going=true;
