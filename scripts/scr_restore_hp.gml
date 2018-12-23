/// void scr_restore_hp(ArgSet);
/* Restores a specific amount of HP to an Entity.
 * Arguments:
 *   - float amount: how much HP to restore.
 */

var heal_instantly;
switch (difficulty){
    case DifficultyModes.noob:
    case DifficultyModes.easy:
        heal_instantly=true;
        break;
    case DifficultyModes.regular:
    case DifficultyModes.hard:
    case DifficultyModes.masochist:
        heal_instantly=false;
        break;
}

var amt=eval(argument0[| 0].value);

if (heal_instantly){
    hp_current=clamp(hp_current+amt, 0, get_max_hp(exp_hp));
} else {
    var hp_target=clamp(hp_current+amt, 0, get_max_hp(exp_hp));
    hp_growth=hp_target-hp_current;
}

World.keep_going=true;
