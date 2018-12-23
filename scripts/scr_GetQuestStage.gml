/// boolean scr_GetQuestStage(ArgSet);
/*  In variable register:
    0. Quest index
*/

var catch=argument0;

World.keep_going=true;

return GetQuestStage(World.vars[0]);
