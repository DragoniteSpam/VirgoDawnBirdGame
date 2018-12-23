enum Quests {
    no,
    test,
    qGhost,
    qUFO,
    qFetch,
    qDragon,
    qMainAct1,
    qMainAct2,
    qMainAct3,
    q07,    q08,    q09,
    q10,    q11,    q12,    q13,    q14,
    q15,    q16,    q17,    q18,    q19,
    q20,    q21,    q22,    q23,    q24,
    q25,    q26,    q27,    q28,    q29,
    q30,    q31,    q32,    q33,    q34,
    q35,    q36,    q37,    q38,    q39,
    q40,    q41,    q42,    q43,    q44,
    q45,    q46,    q47,    q48,    q49,
    q50,    q51,    q52,    q53,    q54,
    q55,    q56,    q57,    q58,    q59,
    q60,    q61,    q62,    q63,    q64,
    q65,    q66,    q67,    q68,    q69,
    q70,    q71,    q72,    q73,    q74,
    q75,    q76,    q77,    q78,    q79,
    q80,    q81,    q82,    q83,    q84,
    q85,    q86,    q87,    q88,    q89,
    q90,    q91,    q92,    q93,    q94,
    q95,    q96,    q97,    q98,    q99
}

globalvar all_quests;

all_quests=array_add(Quests.q99, noone);

all_quests[Quests.no]=instantiate(Quest);
all_quests[Quests.no].name="Blank Quest";
all_quests[Quests.no].internal_name="BlankQuest";
all_quests[Quests.test]=const_quest_test('TestQuest', "Test Quest", "Find a Lawn Mower and return it to some random NPC.", Quests.test);
all_quests[Quests.qGhost]=const_quest_ghost('GhostStories', "Ghost Stories", "There are rumors that the camp site is haunted. Please take care of it.", Quests.qGhost);
all_quests[Quests.qUFO]=const_quest_ufo('SecretOfTheRing', "Secret of The Ring", "I've always wondered if there was some significance to the weird ring structure south of the Dragon Pond.", Quests.qUFO);
all_quests[Quests.qFetch]=const_quest_fetch('TheRunaround', "The Runaround", "The Storage Barn is locked, but there's probably a key. Sounds like a fetch quest.", Quests.qFetch);
all_quests[Quests.qDragon]=const_quest_dragon('FlownAway', "Flown Away", "Local legend tells of a sea monster that inhabits Dragon Pond. Please go get rid of it.", Quests.qDragon);
all_quests[Quests.qMainAct1]=const_quest_main_1('MQAct1', "<Main Quest: Act I>", "You've started your new job at the Aviary. Might as well settle in and get to work!", Quests.qMainAct1);
all_quests[Quests.qMainAct2]=const_quest_main_2('MQAct2', "<Main Quest: Act II>", "", Quests.qMainAct2);
all_quests[Quests.qMainAct3]=const_quest_main_3('MQAct3', "<Main Quest: Act III>", "", Quests.qMainAct3);

for (var i=0; i<array_length_1d(all_quests); i++){
    if (all_quests[i]==noone){
        all_quests[i]=const_quest_STUB('QuestStub'+string(i), "Quest Stub "+string(i), "Placeholder quest.", i);
    }
}
