enum IPockets {
    GENERAL,
    STAFF,
    SWORD,
    COOKING,
    FOOD,
    POTIONS,
    BIRD,
    SHIELDS,
    WEAPON,
    MAIL,
    BOOK,
    BESTIARY,
    KEY,
}

globalvar item_pocket;

item_pocket=array_add(IPockets.KEY);

item_pocket[IPockets.GENERAL]=add_item_pocket("General Items", b_icon_general, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.BIRD]=add_item_pocket("Birds", b_icon_berry, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.SHIELDS]=add_item_pocket("Shields", b_icon_berry, se_explosion, ItemEquipTypes.SHIELD);
item_pocket[IPockets.SWORD]=add_item_pocket("Swords", b_icon_berry, se_explosion, ItemEquipTypes.WEAPON);
item_pocket[IPockets.STAFF]=add_item_pocket("Staves", b_icon_berry, se_explosion, ItemEquipTypes.WEAPON);
item_pocket[IPockets.COOKING]=add_item_pocket("Ingredients", b_icon_berry, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.FOOD]=add_item_pocket("Food", b_icon_berry, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.POTIONS]=add_item_pocket("Potions", b_icon_berry, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.WEAPON]=add_item_pocket("Weapon", b_icon_berry, se_explosion, ItemEquipTypes.WEAPON);
item_pocket[IPockets.BOOK]=add_item_pocket("Books", b_icon_book, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.MAIL]=add_item_pocket("Mail", b_icon_mail, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.BESTIARY]=add_item_pocket("Bestiary Pages", b_icon_missing16, se_explosion, ItemEquipTypes.NONE);
item_pocket[IPockets.KEY]=add_item_pocket("Key Items", b_icon_key, se_explosion, ItemEquipTypes.NONE);

enum ItemEquipTypes {
    NONE,
    WEAPON,
    SHIELD,
}
