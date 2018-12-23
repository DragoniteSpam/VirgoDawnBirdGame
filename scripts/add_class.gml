#define add_class
/// Class add_class(name, image perched, image flying, image swimming, hud script, top speed, gravity, on A, on B, on X, on Y, on Start, on Event, waterwalking?, can weild?, [secondary hud]);

with (instantiate(Class, argument[0])){
    // Graphics
    image=argument[1];
    image_flying=argument[2];
    image_swimming=argument[3];
    hud_script=argument[4];
    // Physics
    factor_top_speed=argument[5];
    factor_gravity=argument[6];
    // Behaviors
    on_press_a=argument[7];
    on_press_b=argument[8];
    on_press_x=argument[9];
    on_press_y=argument[10];
    on_press_start=argument[11];
    on_event_trigger=argument[12];
    // Whatever
    waterwalking=argument[13];
    weilding=argument[14];
    switch (argument_count){
        case 16:
            secondary_hud_script=argument[15];
            break;
    }
    return id;
}

#define add_class_stats_base
/// void add_class_stats_base(class, base_hp, base_magic, hp_regen, magic_regen);

with (all_classes[argument0]){
    base_hp=argument1;
    base_mp=argument2;
    hp_recovery_rate=argument3;
    magic_recovery_rate=argument4;
}

#define add_class_stats_offense
/// void add_class_stats_offense(class, electric, fire, ice, smash, pierce, boom, heal);

with (all_classes[argument0]){
    stat_attack[CombatTypes.electric]=argument1;
    stat_attack[CombatTypes.fire]=argument2;
    stat_attack[CombatTypes.ice]=argument3;
    stat_attack[CombatTypes.smash]=argument4;
    stat_attack[CombatTypes.pierce]=argument5;
    stat_attack[CombatTypes.boom]=argument6;
    stat_attack[CombatTypes.heal]=argument7;
}

#define add_class_stats_defense
/// void add_class_stats_defense(class, electric, fire, ice, smash, pierce, boom, heal);

with (all_classes[argument0]){
    stat_defend[CombatTypes.electric]=argument1;
    stat_defend[CombatTypes.fire]=argument2;
    stat_defend[CombatTypes.ice]=argument3;
    stat_defend[CombatTypes.smash]=argument4;
    stat_defend[CombatTypes.pierce]=argument5;
    stat_defend[CombatTypes.boom]=argument6;
    stat_defend[CombatTypes.heal]=argument7;
}