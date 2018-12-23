enum Classes {
    BirdFlying,
    BirdCasting,
    Boom,
    Person,
    Frog,
    Bear,
    FINAL,
}

globalvar all_classes;

all_classes=array_add(Classes.FINAL);

all_classes[Classes.BirdFlying]=add_class('BirdFlying', NPCImages.Dragon, NPCImages.Dragon, NPCImages.Dragon, class_hud_person, 1, 0.25,
    class_button_interact, class_button_fly_b, class_button_null, class_button_jump, class_button_pause, class_event_trigger, false, false, class_hud_secondary_flight);
all_classes[Classes.BirdCasting]=add_class('BirdCasting', NPCImages.DragonDressed, NPCImages.DragonDressed, NPCImages.DragonDressed, class_hud_person, 1, 0.5,
    class_button_interact, class_button_use_weapon, class_button_cycle_spells, class_button_jump, class_button_pause, class_event_trigger, false, true);
all_classes[Classes.Boom]=add_class('Boom', NPCImages.Dragon, NPCImages.Dragon, NPCImages.Dragon, null, 1, 1,
    null, null, null, null, null, null, false, false);
all_classes[Classes.Person]=add_class('Person', NPCImages.Dragon, NPCImages.Dragon, NPCImages.Dragon, null, 1, 1,
    null, null, null, null, null, null, false, true);
all_classes[Classes.Frog]=add_class('Frog', NPCImages.Frog, NPCImages.Frog, NPCImages.Frog, null, 2, 1,
    null, null, null, null, null, null, false, true);
all_classes[Classes.Bear]=add_class('Bear', NPCImages.Bear, NPCImages.Bear, NPCImages.Bear, null, 1, 1,
    null, null, null, null, null, null, true, true);

add_class_stats_base(Classes.BirdFlying, 10, 10, 0.25, 0.25);
add_class_stats_base(Classes.BirdCasting, 10, 10, 0.25, 0.25);
add_class_stats_base(Classes.Person, 8, 8, 0, 0);
add_class_stats_base(Classes.Frog, 6, 5, 0.25, 0);
add_class_stats_base(Classes.Bear, 16, 4, 0.25, 0);
