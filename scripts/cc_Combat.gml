enum CombatTypes {
    electric=1,
    fire=2,
    ice=4,
    smash=8,
    pierce=16,
    boom=32,
    heal=64,
    unlock=128,
    shove=256,
    teleport=512,
    grow=1024,
    sproing=2048,
    legilimens=4096,
}

globalvar combat_type_names;

combat_type_names=array_add(CombatTypes.heal+1);

combat_type_names[CombatTypes.electric]="Electric";
combat_type_names[CombatTypes.fire]="Fire";
combat_type_names[CombatTypes.ice]="Ice";
combat_type_names[CombatTypes.smash]="Smash";
combat_type_names[CombatTypes.pierce]="Pierce";
combat_type_names[CombatTypes.boom]="Boom";
combat_type_names[CombatTypes.heal]="Heal";

globalvar combat_type_weapon_shaders;

combat_type_weapon_shaders=array_add(CombatTypes.heal+1);

combat_type_weapon_shaders[CombatTypes.electric]=shd_default;
combat_type_weapon_shaders[CombatTypes.fire]=shd_sepia_fire;
combat_type_weapon_shaders[CombatTypes.ice]=shd_sepia_ice;
combat_type_weapon_shaders[CombatTypes.smash]=shd_default;
combat_type_weapon_shaders[CombatTypes.pierce]=shd_default;
combat_type_weapon_shaders[CombatTypes.boom]=shd_default;
combat_type_weapon_shaders[CombatTypes.heal]=shd_default;

globalvar combat_type_weapon_effects;

combat_type_weapon_effects=array_add(CombatTypes.heal+1);

combat_type_weapon_effects[CombatTypes.electric]=we_electric;
combat_type_weapon_effects[CombatTypes.fire]=we_fire;
combat_type_weapon_effects[CombatTypes.ice]=we_ice;
combat_type_weapon_effects[CombatTypes.smash]=null;
combat_type_weapon_effects[CombatTypes.pierce]=null;
combat_type_weapon_effects[CombatTypes.boom]=null;
combat_type_weapon_effects[CombatTypes.heal]=we_heal;

globalvar combat_type_attacks;

combat_type_attacks=array_add(CombatTypes.heal+1);

combat_type_attacks[CombatTypes.electric]=create_ball_lightning;
combat_type_attacks[CombatTypes.fire]=create_ball_fire;
combat_type_attacks[CombatTypes.ice]=create_ice_spike;
combat_type_attacks[CombatTypes.smash]=null;
combat_type_attacks[CombatTypes.pierce]=null;
combat_type_attacks[CombatTypes.boom]=null;
combat_type_attacks[CombatTypes.heal]=create_heal_blob;

enum Aggro {
    friendly,
    neutral,
    mad,
}

globalvar aggro_level_names;
aggro_level_names[Aggro.mad]="Mad";
aggro_level_names[Aggro.neutral]="Neutral";
aggro_level_names[Aggro.friendly]="Friendly";

enum MagicTypes {
    offensive,
    unlock,
    shove,
    heal,
    translate,
    invincibile,
    revelation,
    teleport,
    bloom,
    sproing,
    legilimens,
    final
}

globalvar magic_names;
magic_names=array_create(MagicTypes.final);

magic_names[MagicTypes.offensive]="Offensive";
magic_names[MagicTypes.unlock]="Unlock";
magic_names[MagicTypes.shove]="Shove";
magic_names[MagicTypes.heal]="Heal";
magic_names[MagicTypes.translate]="Translate";
magic_names[MagicTypes.invincibile]="Invincibility";
magic_names[MagicTypes.revelation]="Revelation";
magic_names[MagicTypes.teleport]="Teleportation";
magic_names[MagicTypes.bloom]="Bloom";
magic_names[MagicTypes.sproing]="Sproing";
magic_names[MagicTypes.legilimens]="Mind Reading";

globalvar magic_cost;
magic_cost=array_create(MagicTypes.final);

magic_cost[MagicTypes.offensive]=10;
magic_cost[MagicTypes.unlock]=15;
magic_cost[MagicTypes.shove]=5;
magic_cost[MagicTypes.heal]=8;
magic_cost[MagicTypes.translate]=10;
magic_cost[MagicTypes.invincibile]=100;
magic_cost[MagicTypes.revelation]=12;
magic_cost[MagicTypes.teleport]=15;
magic_cost[MagicTypes.bloom]=8;
magic_cost[MagicTypes.sproing]=12;
magic_cost[MagicTypes.legilimens]=4;
