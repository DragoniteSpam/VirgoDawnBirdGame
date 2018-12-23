/// void class_button_cycle_spells();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (Controller.press_x){
    switch (Player.spell){
        case CombatTypes.electric:
            Player.spell=CombatTypes.fire;
            break;
        case CombatTypes.fire:
            Player.spell=CombatTypes.ice;
            break;
        case CombatTypes.ice:
            Player.spell=CombatTypes.electric;
            break;
    }
}
