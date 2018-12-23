enum ItemWeaponGraphics {
    no,
    staff,
    frog_tongue,
    baseball,
    gear,
    baseball_bat,
    bow,
    scythe,
    football,
    staff_unlock,
    staff_shove,
    staff_heal,
    staff_translate,
    staff_invincible,
    staff_revelation,
    staff_teleport,
    staff_bloom,
    staff_sproing,
    staff_legilimens,
    sword,
    shield_wood_1,
    shield_wood_2,
    shield_wood_3,
    shield_wood_4,
    shield_wood_5,
    shield_wood_6,
    shield_wood_7,
    shield_wood_8,
    shield_wood_9,
    shield_metal_10,
    shield_metal_11,
    shield_metal_12,
    shield_metal_13,
    shield_metal_14,
    shield_metal_15,
    shield_metal_16,
    shield_metal_17,
    shield_metal_18,
}

globalvar all_weapon_graphics;
all_weapon_graphics=array_create(ItemWeaponGraphics.shield_metal_18);

all_weapon_graphics[ItemWeaponGraphics.no]=add_item_weapon_graphic("None", null);
all_weapon_graphics[ItemWeaponGraphics.staff]=add_item_weapon_graphic("Staff", wg_staff);
all_weapon_graphics[ItemWeaponGraphics.frog_tongue]=add_item_weapon_graphic("Frog Tongue", wg_frog_tongue);
all_weapon_graphics[ItemWeaponGraphics.baseball]=add_item_weapon_graphic("Baseball", wg_baseball);
all_weapon_graphics[ItemWeaponGraphics.gear]=add_item_weapon_graphic("Gear", wg_gear);
all_weapon_graphics[ItemWeaponGraphics.baseball_bat]=add_item_weapon_graphic("Baseball Bat", wg_baseball_bat);
all_weapon_graphics[ItemWeaponGraphics.bow]=add_item_weapon_graphic("Bow", wg_bow);
all_weapon_graphics[ItemWeaponGraphics.scythe]=add_item_weapon_graphic("Scythe", wg_scythe);
all_weapon_graphics[ItemWeaponGraphics.football]=add_item_weapon_graphic("Football", wg_football);
all_weapon_graphics[ItemWeaponGraphics.staff_unlock]=add_item_weapon_graphic("Staff: Unlock", wg_staff_unlock);
all_weapon_graphics[ItemWeaponGraphics.staff_shove]=add_item_weapon_graphic("Staff: Shove", wg_staff_shove);
all_weapon_graphics[ItemWeaponGraphics.staff_heal]=add_item_weapon_graphic("Staff: Heal", wg_staff_heal);
all_weapon_graphics[ItemWeaponGraphics.staff_translate]=add_item_weapon_graphic("Staff: Translate", wg_staff_translate);
all_weapon_graphics[ItemWeaponGraphics.staff_invincible]=add_item_weapon_graphic("Staff: Invincible", wg_staff_invincible);
all_weapon_graphics[ItemWeaponGraphics.staff_revelation]=add_item_weapon_graphic("Staff: Revelation", wg_staff_revelation);
all_weapon_graphics[ItemWeaponGraphics.staff_teleport]=add_item_weapon_graphic("Staff: Teleport", wg_staff_teleport);
all_weapon_graphics[ItemWeaponGraphics.staff_bloom]=add_item_weapon_graphic("Staff: Bloom", wg_staff_bloom);
all_weapon_graphics[ItemWeaponGraphics.staff_sproing]=add_item_weapon_graphic("Staff: Sproing", wg_staff_sproing);
all_weapon_graphics[ItemWeaponGraphics.staff_legilimens]=add_item_weapon_graphic("Staff: Legilimens", wg_staff_legilimens);
all_weapon_graphics[ItemWeaponGraphics.sword]=add_item_weapon_graphic("Sword", wg_sword);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_1]=add_item_weapon_graphic("Shield Wood 1", sg_wood_1);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_2]=add_item_weapon_graphic("Shield Wood 2", sg_wood_2);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_3]=add_item_weapon_graphic("Shield Wood 3", sg_wood_3);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_4]=add_item_weapon_graphic("Shield Wood 4", sg_wood_4);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_5]=add_item_weapon_graphic("Shield Wood 5", sg_wood_5);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_6]=add_item_weapon_graphic("Shield Wood 6", sg_wood_6);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_7]=add_item_weapon_graphic("Shield Wood 7", sg_wood_7);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_8]=add_item_weapon_graphic("Shield Wood 8", sg_wood_8);
all_weapon_graphics[ItemWeaponGraphics.shield_wood_9]=add_item_weapon_graphic("Shield Wood 9", sg_wood_9);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_10]=add_item_weapon_graphic("Shield Metal 10", sg_metal_10);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_11]=add_item_weapon_graphic("Shield Metal 11", sg_metal_11);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_12]=add_item_weapon_graphic("Shield Metal 12", sg_metal_12);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_13]=add_item_weapon_graphic("Shield Metal 13", sg_metal_13);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_14]=add_item_weapon_graphic("Shield Metal 14", sg_metal_14);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_15]=add_item_weapon_graphic("Shield Metal 15", sg_metal_15);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_16]=add_item_weapon_graphic("Shield Metal 16", sg_metal_16);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_17]=add_item_weapon_graphic("Shield Metal 17", sg_metal_17);
all_weapon_graphics[ItemWeaponGraphics.shield_metal_18]=add_item_weapon_graphic("Shield Metal 18", sg_metal_18);

enum ItemWeaponEffects {
    no,
    baseball,
    bow,
    football,
    frog_tongue,
    gear,
    scythe,
    staff,
    staff_bloom,
    staff_heal,
    staff_invincible,
    staff_legilimens,
    staff_revelation,
    staff_shove,
    staff_sproing,
    staff_teleport,
    staff_translate,
    staff_unlock,
    sword,
}

globalvar all_weapon_effects;
all_weapon_effects=array_create(ItemWeaponEffects.sword);

all_weapon_effects[ItemWeaponEffects.no]=add_item_weapon_effect("None", null);
all_weapon_effects[ItemWeaponEffects.baseball]=add_item_weapon_effect("Baseball", we_baseball);
all_weapon_effects[ItemWeaponEffects.bow]=add_item_weapon_effect("Bow", we_bow);
all_weapon_effects[ItemWeaponEffects.football]=add_item_weapon_effect("Football", we_football);
all_weapon_effects[ItemWeaponEffects.frog_tongue]=add_item_weapon_effect("Frog Tongue", we_frog_tongue);
all_weapon_effects[ItemWeaponEffects.gear]=add_item_weapon_effect("Gear", we_gear);
all_weapon_effects[ItemWeaponEffects.scythe]=add_item_weapon_effect("Scythe", we_scythe);
all_weapon_effects[ItemWeaponEffects.staff]=add_item_weapon_effect("Staff", we_staff);
all_weapon_effects[ItemWeaponEffects.staff_bloom]=add_item_weapon_effect("Staff: Bloom", we_staff_bloom);
all_weapon_effects[ItemWeaponEffects.staff_heal]=add_item_weapon_effect("Staff: Heal", we_staff_heal);
all_weapon_effects[ItemWeaponEffects.staff_invincible]=add_item_weapon_effect("Staff: Invincible", we_staff_invincible);
all_weapon_effects[ItemWeaponEffects.staff_legilimens]=add_item_weapon_effect("Staff: Legilimens", we_staff_legilimens);
all_weapon_effects[ItemWeaponEffects.staff_revelation]=add_item_weapon_effect("Staff: Revelation", we_staff_revelation);
all_weapon_effects[ItemWeaponEffects.staff_shove]=add_item_weapon_effect("Staff: Shove", we_staff_shove);
all_weapon_effects[ItemWeaponEffects.staff_sproing]=add_item_weapon_effect("Staff: Sproing", we_staff_sproing);
all_weapon_effects[ItemWeaponEffects.staff_teleport]=add_item_weapon_effect("Staff: Teleport", we_staff_teleport);
all_weapon_effects[ItemWeaponEffects.staff_translate]=add_item_weapon_effect("Staff: Translate", we_staff_translate);
all_weapon_effects[ItemWeaponEffects.staff_unlock]=add_item_weapon_effect("Staff: Unlock", we_staff_unlock);
all_weapon_effects[ItemWeaponEffects.sword]=add_item_weapon_effect("Sword", we_sword);
