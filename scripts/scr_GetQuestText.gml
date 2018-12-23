/// boolean scr_GetHasCompletedQuest(ArgSet);
/*  In variable register:
    0. Quest index
*/

var catch=argument0;

World.keep_going=true;

return all_quests[World.vars[0]].description;
