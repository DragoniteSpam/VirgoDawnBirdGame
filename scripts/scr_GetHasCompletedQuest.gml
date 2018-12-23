/// boolean scr_GetHasCompletedQuest(ArgSet);
/*  In variable register:
    0. Quest index
*/

var catch=argument0;

World.keep_going=true;

return HasCompletedQuest(World.vars[0]);
