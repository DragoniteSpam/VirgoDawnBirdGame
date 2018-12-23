enum DifficultyModes {
    noob,
    easy,
    regular,
    hard,
    masochist
}

globalvar all_difficulties;

all_difficulties[DifficultyModes.noob]=get_text(Text.diffNoob);
all_difficulties[DifficultyModes.easy]=get_text(Text.diffEasy);
all_difficulties[DifficultyModes.regular]=get_text(Text.diffRegular);
all_difficulties[DifficultyModes.hard]=get_text(Text.diffHard);
all_difficulties[DifficultyModes.masochist]=get_text(Text.diffMasochist);
