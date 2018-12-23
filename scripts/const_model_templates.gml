enum ModelTemplates {
    door00,
    door01,
    fountain00,
    npc00,
    npc01,
    npc02,
    fire,
    fire_harmful,
    lamp,
    chest,
    door_password00,
    bird00,
    bird01,
    waypoint00,
    event,
    event_collectable,
    death00,
    death01,
    death02,
    event_radius,
    clock00,
    underpass00,
    rock00,
    rock01,
    rock02,
    rock03,
    rock04,
    invisible,
    house00,
    house01,
    house02,
    house03,
    tavern00,
    bulb_large,
    bulb_small,
    sproing00,
    cooking00,
    cauldron00,
    pressureplate,
    library00,
    teleport00,
    emitter00,
    candle00,
    heart00,
    moving_translating,
    moving_rotating,
    final,
}

globalvar all_model_templates;

all_model_templates=array_add(ModelTemplates.final-1);  // this has to be -1 because code later checks the length of the array

all_model_templates[ModelTemplates.door00]=cmt_door00();
all_model_templates[ModelTemplates.door01]=cmt_door01();
all_model_templates[ModelTemplates.door_password00]=cmt_door_pswd();
all_model_templates[ModelTemplates.fountain00]=cmt_fountain00();
all_model_templates[ModelTemplates.npc00]=cmt_npc00();
all_model_templates[ModelTemplates.npc01]=cmt_npc01();
all_model_templates[ModelTemplates.npc02]=cmt_npc02();
all_model_templates[ModelTemplates.fire]=cmt_fire00();
all_model_templates[ModelTemplates.fire_harmful]=cmt_fire01();
all_model_templates[ModelTemplates.lamp]=cmt_lamp00();
all_model_templates[ModelTemplates.chest]=cmt_chest00();
all_model_templates[ModelTemplates.bird00]=cmt_bird00();
all_model_templates[ModelTemplates.bird01]=cmt_bird01();
all_model_templates[ModelTemplates.waypoint00]=cmt_waypoint00();
all_model_templates[ModelTemplates.event]=cmt_event();
all_model_templates[ModelTemplates.event_collectable]=cmt_event_collectable();
all_model_templates[ModelTemplates.death00]=cmt_death00();
all_model_templates[ModelTemplates.death01]=cmt_death01();
all_model_templates[ModelTemplates.death02]=cmt_death02();
all_model_templates[ModelTemplates.event_radius]=cmt_event_radius();
all_model_templates[ModelTemplates.clock00]=cmt_clock00();
all_model_templates[ModelTemplates.underpass00]=cmt_underpass00();
all_model_templates[ModelTemplates.rock00]=cmt_rock00();
all_model_templates[ModelTemplates.rock01]=cmt_rock01();
all_model_templates[ModelTemplates.rock02]=cmt_rock02();
all_model_templates[ModelTemplates.rock03]=cmt_rock03();
all_model_templates[ModelTemplates.rock04]=cmt_rock04();
all_model_templates[ModelTemplates.invisible]=cmt_invisible00();

all_model_templates[ModelTemplates.house00]=cmt_house00();
all_model_templates[ModelTemplates.house01]=cmt_house01();
all_model_templates[ModelTemplates.house02]=cmt_house02();
all_model_templates[ModelTemplates.house03]=cmt_house03();
all_model_templates[ModelTemplates.tavern00]=cmt_tavern00();
all_model_templates[ModelTemplates.library00]=cmt_library00();

all_model_templates[ModelTemplates.bulb_large]=cmt_flowerbulb_large();
all_model_templates[ModelTemplates.bulb_small]=cmt_flowerbulb_small();
all_model_templates[ModelTemplates.sproing00]=cmt_sproing00();

all_model_templates[ModelTemplates.cooking00]=cmt_cooking00();
all_model_templates[ModelTemplates.cauldron00]=cmt_cauldron00();
all_model_templates[ModelTemplates.pressureplate]=cmt_pressureplate00();
all_model_templates[ModelTemplates.teleport00]=cmt_teleport00();

all_model_templates[ModelTemplates.emitter00]=cmt_emitter00();

all_model_templates[ModelTemplates.candle00]=cmt_candle00();

all_model_templates[ModelTemplates.heart00]=cmt_heart00();
all_model_templates[ModelTemplates.moving_translating]=cmt_moving_translating();
all_model_templates[ModelTemplates.moving_rotating]=cmt_moving_rotating();
