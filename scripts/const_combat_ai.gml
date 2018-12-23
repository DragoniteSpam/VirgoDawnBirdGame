enum CombatAITypes {
    flee,
    magic,
    pierce,
    smash,
    frog,
    bear,
    baseball,
    football,
    archery,
    final
}

globalvar all_combat_ai_types;
all_combat_ai_types=array_add(CombatAITypes.final, noone);

all_combat_ai_types[CombatAITypes.flee]=add_combat_ai("Flee", cai_step_flee, cai_evaluate_flee);
all_combat_ai_types[CombatAITypes.magic]=add_combat_ai("Magic", cai_step_magic, cai_evaluate_magic);
all_combat_ai_types[CombatAITypes.pierce]=add_combat_ai("Pierce", cai_step_magic, cai_evaluate_magic);
all_combat_ai_types[CombatAITypes.smash]=add_combat_ai("Smash", cai_step_smash, cai_evaluate_smash);
all_combat_ai_types[CombatAITypes.frog]=add_combat_ai("Frog", cai_step_frog, cai_evaluate_frog);
all_combat_ai_types[CombatAITypes.bear]=add_combat_ai("Bear", cai_step_bear, cai_evaluate_bear);
all_combat_ai_types[CombatAITypes.baseball]=add_combat_ai("Baseball", cai_step_baseball, cai_evaluate_baseball);
all_combat_ai_types[CombatAITypes.football]=add_combat_ai("Football", cai_step_football, cai_evaluate_football);
all_combat_ai_types[CombatAITypes.archery]=add_combat_ai("Archery", cai_step_archery, cai_evaluate_archery);

all_combat_ai_types[CombatAITypes.final]=add_combat_ai("Flee (B)", cai_step_flee, cai_evaluate_flee);

