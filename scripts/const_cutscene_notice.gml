var l=ds_list_create();
ds_list_add(l, args(scr_lock_set)); 
ds_list_add(l, args(scr_talk, "There are a bunch of requests pinned on the notice board."));
ds_list_add(l, args(scr_set_multi_option, all_quests[Quests.qGhost].name, 0, all_quests[Quests.qUFO].name, 1, all_quests[Quests.qFetch].name, 2,
    all_quests[Quests.qDragon].name, 3, "Sidequest E", 4, "Sidequest F", 5, "Sidequest G", 6));
ds_list_add(l, args(scr_set_multi_option_more, "Sidequest H", 7, "Sidequest I", 8, "Sidequest J", 9,
    "Sidequest K", 10, "Sidequest L", 11, "Sidequest M", 13));
ds_list_add(l, args(scr_talk, "Which one would you like to read?"));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_goto, "kGhostStories"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 1, scr_goto, "kUFO"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 2, scr_goto, "kRunaround"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 3, scr_goto, "kDragon"));
/*ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 4, scr_weather, WeatherTypes.blizzard));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 5, scr_weather, WeatherTypes.hail));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 6, scr_weather, WeatherTypes.sand));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 7, scr_weather, WeatherTypes.rain));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 8, scr_weather, WeatherTypes.heavyrain));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 9, scr_weather, WeatherTypes.snow));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 10, scr_weather, WeatherTypes.blizzard));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 11, scr_weather, WeatherTypes.hail));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 12, scr_weather, WeatherTypes.sand));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 13, scr_weather, WeatherTypes.rain));*/

ds_list_add(l, args(scr_keyword, "kGhostStories"));
ds_list_add(l, args(scr_push_raw, 0, Quests.qGhost));
ds_list_add(l, args(scr_do_if, scr_GetQuestCompleted, Misc.equal, true, scr_talk, "You've already completed this quest!"));
ds_list_add(l, args(scr_do_if, scr_GetQuestCompleted, Misc.equal, true, scr_goto, "END"));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, true, scr_talk, "You've already taken on this quest!"));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, true, scr_goto, "END"));
ds_list_add(l, args(scr_push, 1, scr_GetQuestText));
ds_list_add(l, args(scr_talk, 'The request says, "&1"'));
ds_list_add(l, args(scr_set_multi_option, "Let's do this.", 0, "Nah.", 1));
ds_list_add(l, args(scr_talk, "Would you like to accept it?"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_quest_begin, Quests.qGhost));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_goto, "END"));

ds_list_add(l, args(scr_keyword, "kUFO"));
ds_list_add(l, args(scr_push_raw, 0, Quests.qUFO));
ds_list_add(l, args(scr_do_if, scr_GetQuestCompleted, Misc.equal, true, scr_talk, "You've already completed this quest!"));
ds_list_add(l, args(scr_do_if, scr_GetQuestCompleted, Misc.equal, true, scr_goto, "END"));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, true, scr_talk, "You've already taken on this quest!"));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, true, scr_goto, "END"));
ds_list_add(l, args(scr_push, 1, scr_GetQuestText));
ds_list_add(l, args(scr_talk, 'The request says, "&1"'));
ds_list_add(l, args(scr_set_multi_option, "Let's do this.", 0, "Nah.", 1));
ds_list_add(l, args(scr_talk, "Would you like to accept it?"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_quest_begin, Quests.qUFO));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_goto, "END"));

ds_list_add(l, args(scr_keyword, "kRunaround"));
ds_list_add(l, args(scr_push_raw, 0, Quests.qFetch));
ds_list_add(l, args(scr_do_if, scr_GetQuestCompleted, Misc.equal, true, scr_talk, "You've already completed this quest!"));
ds_list_add(l, args(scr_do_if, scr_GetQuestCompleted, Misc.equal, true, scr_goto, "END"));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, true, scr_talk, "You've already taken on this quest!"));
ds_list_add(l, args(scr_do_if, scr_GetHasStartedQuest, Misc.equal, true, scr_goto, "END"));
ds_list_add(l, args(scr_push, 1, scr_GetQuestText));
ds_list_add(l, args(scr_talk, 'The request says, "&1"'));
ds_list_add(l, args(scr_set_multi_option, "Let's do this.", 0, "Nah.", 1));
ds_list_add(l, args(scr_talk, "Would you like to accept it?"));
ds_list_add(l, args(scr_do_if, scr_GetMultipleChoice, Misc.equal, 0, scr_quest_begin, Quests.qFetch));
ds_list_add(l, args(scr_hide_multi_option));
ds_list_add(l, args(scr_goto, "END"));

ds_list_add(l, args(scr_keyword, "kDragon"));
ds_list_add(l, args(scr_talk, "This quest has been disabled because it sucks. Sorry!"));
ds_list_add(l, args(scr_goto, "END"));

ds_list_add(l, args(scr_keyword, "END"));
ds_list_add(l, args(scr_lock_unset));

return l;
