/// void scr_validate_quests(ArgSet);
/* Validates all currently active quests.
 * Arguments:
 *   - [double option]: optional arguments to pass to the Validate Quests script
 */

if (ds_list_size(argument0)==1){
    ValidateAllQuests(eval(argument0[| 0].value));
} else {
    ValidateAllQuests();
}

World.keep_going=true;
