/// scr_cutscene_launch(cutscene map index);

World.cutscene_index=argument0;

if (!ds_map_exists(cutscene_map, World.cutscene_index)){
    World.cutscene_index=get_cutscene_from_name("No", 0);
}

var cutscene=cutscene_map[? World.cutscene_index];
World.cutscene=id;
if (cutscene.uptodate||editor_cutscene_compile_cutscene(cutscene)){
    cutscene.uptodate=true;
    World.scene_index=0;
    scr_continue(World.cutscene_index); // this is the new use for scr_continue. please do not remove it.
} else {
    show_message("Cutscene has errors in it. Please fix those errors and re-run (remember to save!).");
}
