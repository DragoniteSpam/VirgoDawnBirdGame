enum DeathScripts {
    none,
    regular,
    poof,
    final
}

globalvar all_death_scripts;

all_death_scripts[DeathScripts.final]=add_death_script("final", null);

all_death_scripts[DeathScripts.none]=add_death_script("None", null);
all_death_scripts[DeathScripts.regular]=add_death_script("Regular", death_regular);
all_death_scripts[DeathScripts.poof]=add_death_script("Poof", death_poof);

enum DeathTypes {
    death_mob,
    death_drown,
    death_lava,
    death_translate,
    death_other,
}

globalvar all_death_type_names;

all_death_type_names[DeathTypes.death_other]=get_text(Text.dtOther);
all_death_type_names[DeathTypes.death_mob]=get_text(Text.dtMob);
all_death_type_names[DeathTypes.death_drown]=get_text(Text.dtDrown);
all_death_type_names[DeathTypes.death_lava]=get_text(Text.dtLava);
all_death_type_names[DeathTypes.death_translate]=get_text(Text.dtTranslate);

enum HitScripts {
    none,
    destroy_small,
    destroy_large,
    destroy_gunpowder,
    open,
    ignite,
    knockover,
    mob,
    teleport,
    flowerbulb,
    sproing,
    shove,
    final,
}

globalvar all_hit_scripts;

all_hit_scripts[HitScripts.final]=null;

all_hit_scripts[HitScripts.none]=null;
all_hit_scripts[HitScripts.destroy_small]=hit_destroy_small;
all_hit_scripts[HitScripts.destroy_large]=hit_destroy_large;
all_hit_scripts[HitScripts.destroy_gunpowder]=hit_destroy_gunpowder;
all_hit_scripts[HitScripts.open]=hit_open;
all_hit_scripts[HitScripts.ignite]=hit_ignite;
all_hit_scripts[HitScripts.knockover]=hit_knockover;
all_hit_scripts[HitScripts.mob]=hit_mob;
all_hit_scripts[HitScripts.teleport]=hit_teleport;
all_hit_scripts[HitScripts.flowerbulb]=hit_flowerbulb;
all_hit_scripts[HitScripts.sproing]=hit_sproing;
all_hit_scripts[HitScripts.shove]=hit_shove;

