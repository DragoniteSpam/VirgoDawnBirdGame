#define scr_GetQuestUFO
/// boolean scr_GetQuestUFO(ArgSet);

var catch=argument0;

World.keep_going=true;

return dsin(MOON_ANGLE)>0.125&&GetQuestStage(Quests.qUFO)==100;

#define scr_GetQuestUFOB
/// boolean scr_GetQuestUFOB(ArgSet);

var catch=argument0;

World.keep_going=true;

return dsin(MOON_ANGLE)>0.125&&GetQuestStage(Quests.qUFO)==400;