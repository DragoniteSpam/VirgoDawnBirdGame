/// void Actor.scr_set_scene(index);
// goes to a particular stage in someone's cutscene

World.cutscene=id;      // this is just so that the game knows who
scene_index=argument0;  // should continue in asynchronous cutscenes
var _arg=scr_get_arg_set();
script_execute(_arg.script, _arg);
