AddItem(BASE_ASSET, Items.STAFF, 1);
AddItem(BASE_ASSET, Items.STAFF_UNLOCK, 1); //
AddItem(BASE_ASSET, Items.STAFF_SHOVE, 1);  //
AddItem(BASE_ASSET, Items.STAFF_HEAL, 1);
AddItem(BASE_ASSET, Items.STAFF_INVINCIBLE, 1);
AddItem(BASE_ASSET, Items.STAFF_TRANSLATE, 1);
AddItem(BASE_ASSET, Items.STAFF_REVELATION, 1); //
AddItem(BASE_ASSET, Items.STAFF_TELEPORT, 1);
AddItem(BASE_ASSET, Items.STAFF_BLOOM, 1);  //
AddItem(BASE_ASSET, Items.STAFF_SPROING, 1);
AddItem(BASE_ASSET, Items.STAFF_LEGILIMENS, 1); //

AddItem(BASE_ASSET, Items.SWORD, 1);
AddItem(BASE_ASSET, Items.FROG_TONGUE, 1);
AddItem(BASE_ASSET, Items.BASEBALL, 10);
AddItem(BASE_ASSET, Items.FOOTBALL, 10);
AddItem(BASE_ASSET, Items.GEAR, 10);
AddItem(BASE_ASSET, Items.SCYTHE, 1);
AddItem(BASE_ASSET, Items.BOW, 1);
AddItem(BASE_ASSET, Items.ARROW, 100);
AddItem(BASE_ASSET, Items.shield_wood_1, 1);

AddItem(BASE_ASSET, Items.cooking_salt, 1);
AddItem(BASE_ASSET, Items.cooking_flour, 1);
AddItem(BASE_ASSET, Items.cooking_yeast, 1);
AddItem(BASE_ASSET, Items.cooking_raw_chicken, 1);
AddItem(BASE_ASSET, Items.cooking_raw_fish, 1);

AddItem(BASE_ASSET, Items.ACHBOOK, 1);
AddItem(BASE_ASSET, Items.STATBOOK, 1);

AddItem(BASE_ASSET, Items.potion_health_25, 1);
AddItem(BASE_ASSET, Items.potion_magic_100, 100);
item_equip_weapon(ds_map_find_value(all_mod_packages, BASE_ASSET).my_items[Items.STAFF]);
item_equip_shield(ds_map_find_value(all_mod_packages, BASE_ASSET).my_items[Items.shield_wood_1]);

Player.exp_hp=20;
Player.hp_current=get_max_hp(Player.exp_hp);
Player.exp_mp=36;
Player.mp_current=get_max_mp(Player.exp_mp);
