enum ItemEffectCodes {
    NO,
    SACRED_ASH,
    KEY,
    BERRY,
    EXIT_DUNGEON,
    FOSSIL,
    SELL_TO_CHEF, SELL_TO_ROCK, SELL_TO_COLLECTOR, SELL_TO_GARDENER,
    CREDITS,
    FISH,
    SEE_ITEMS,
    MAP,
    BOOK,
    JOURNAL,
    COLLECT_SOOT,
    WATER_PLANTS,
    ACT_AS_KEY,
    GAME_SUMMARY,
    OPEN_BESTIARY,
    ACH_BOOK,
    STAT_BOOK,
    DOWSING_MACHINE,
    RADIO,
    YOU_CANT_USE_THIS_HERE,
    QUEST_UFO,
    BOOK_ATOB,
    CUSTOMIZATION_CLOTH,
    CUSTOMIZATION_HAT,
    CUSTOMIZATION_HAIR,
    CUSTOMIZATION_ACC,
    BESTIARY,
    EQUIP_WEAPON,
    EQUIP_SHIELD,
    HEAL_HP,
    HEAL_MP,
    HEAL_HP_DISCRETE,
    HEAL_MP_DISCRETE,
    final,
}

var arr=array_add(ItemEffectCodes.final, noone);

arr[ItemEffectCodes.NO]=add_item_effect('None', null);
arr[ItemEffectCodes.SACRED_ASH]=add_item_effect('Sacred Ash', null);
arr[ItemEffectCodes.KEY]=add_item_effect('Key', null);
arr[ItemEffectCodes.BERRY]=add_item_effect('Berry', null);
arr[ItemEffectCodes.EXIT_DUNGEON]=add_item_effect('Exit Dungeon', null);
arr[ItemEffectCodes.FOSSIL]=add_item_effect('Fossil', null);
arr[ItemEffectCodes.SELL_TO_CHEF]=add_item_effect('Sell: Chef', null);
arr[ItemEffectCodes.SELL_TO_ROCK]=add_item_effect('Sell: Rock', null);
arr[ItemEffectCodes.SELL_TO_COLLECTOR]=add_item_effect('Sell: Collector', null);
arr[ItemEffectCodes.SELL_TO_GARDENER]=add_item_effect('Sell: Gardener', null);
arr[ItemEffectCodes.CREDITS]=add_item_effect('Operate Credits', item_show_book_credit);
arr[ItemEffectCodes.FISH]=add_item_effect('Fish', null);
arr[ItemEffectCodes.SEE_ITEMS]=add_item_effect('Reveal: Items', null);
arr[ItemEffectCodes.MAP]=add_item_effect('Map', null);
arr[ItemEffectCodes.BOOK]=add_item_effect('Operate Book', item_show_book);
arr[ItemEffectCodes.JOURNAL]=add_item_effect('Operate Journal', item_show_journal);
arr[ItemEffectCodes.COLLECT_SOOT]=add_item_effect('Collect Soot', null);
arr[ItemEffectCodes.WATER_PLANTS]=add_item_effect('Water Plants', null);
arr[ItemEffectCodes.ACT_AS_KEY]=add_item_effect('Key to Door', null);
arr[ItemEffectCodes.GAME_SUMMARY]=add_item_effect('Special: Summary', item_show_summary);
arr[ItemEffectCodes.OPEN_BESTIARY]=add_item_effect('Special: Bestiary', item_show_bestiary);
arr[ItemEffectCodes.ACH_BOOK]=add_item_effect('Special: Achievements', item_show_ach_book);
arr[ItemEffectCodes.STAT_BOOK]=add_item_effect('Special: Stats', item_show_stat_book);
// Dowsing Machine
arr[ItemEffectCodes.RADIO]=add_item_effect('Special: Radio', item_show_radio);
arr[ItemEffectCodes.YOU_CANT_USE_THIS_HERE]=add_item_effect('Cant Use', null);
arr[ItemEffectCodes.QUEST_UFO]=add_item_effect('Quest: UFO (does nothing)', null);
arr[ItemEffectCodes.BOOK_ATOB]=add_item_effect('Book (A to B)', item_show_book_atob);
arr[ItemEffectCodes.BESTIARY]=add_item_effect('Show Bestiary Page', item_show_bestiary_page);
arr[ItemEffectCodes.EQUIP_WEAPON]=add_item_effect('Equip Weapon', item_equip_weapon);
arr[ItemEffectCodes.EQUIP_SHIELD]=add_item_effect('Equip Shield', item_equip_shield);

// Potion effects
arr[ItemEffectCodes.HEAL_HP]=add_item_effect('Heal HP', item_heal_hp);
arr[ItemEffectCodes.HEAL_MP]=add_item_effect('Heal MP', item_heal_mp);

arr[ItemEffectCodes.HEAL_HP_DISCRETE]=add_item_effect('Heal HP Discrete', item_heal_hp_discrete);
arr[ItemEffectCodes.HEAL_MP_DISCRETE]=add_item_effect('Heal MP Discrete', item_heal_mp_discrete);

for (var i=0; i<array_length_1d(arr); i++){
    if (arr[i]==noone){
        arr[i]=add_item_effect('IEffect'+string(i), null);
    }
}

(ds_map_find_value(all_mod_packages, BASE_ASSET)).my_item_effects=arr;

enum BookCodes {
    LoremIpsum,
    Help,
    Todo,
    AlienMemoA,
    AlienMemoB,
}
