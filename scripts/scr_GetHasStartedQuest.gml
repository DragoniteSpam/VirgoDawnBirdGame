/// boolean scr_GetHasStartedQuest(ArgSet);
/*  In variable register:
    0. Quest index
*/

var catch=argument0;

World.keep_going=true;

return HasStartedQuest(World.vars[0]);
