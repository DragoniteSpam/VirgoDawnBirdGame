enum Cards {
    UNUSED11,
    UNUSED12,
    UNUSED13,
    UNUSED14,
    UNUSED15,
    UNUSED16,
    UNUSED17,
    UNUSED18,
    UNUSED19,
    UNUSED20,
    UNUSED21,
    UNUSED22,
    UNUSED23,
    UNUSED24,
    UNUSED25,
    UNUSED26,
    UNUSED27,
    UNUSED28,
    UNUSED29,
    UNUSED30,
    UNUSED31,
    UNUSED32,
    UNUSED33,
    UNUSED34,
    UNUSED35,
    UNUSED36,
    UNUSED37,
    UNUSED38,
    UNUSED39,
    UNUSED40,
    UNUSED41,
    UNUSED42,
    UNUSED43,
    UNUSED44,
    UNUSED45,
    UNUSED46,
    UNUSED47,
    UNUSED48,
    UNUSED49,
    UNUSED50,
    UNUSED51,
    UNUSED52,
    UNUSED53,
    UNUSED54,
    UNUSED55,
    UNUSED56,
    UNUSED57,
    UNUSED58,
    UNUSED59,
    UNUSED60,
    UNUSED61,
    UNUSED62,
    UNUSED63,
    UNUSED64,
    UNUSED65,
    UNUSED66,
    UNUSED67,
    UNUSED68,
    UNUSED69,
    UNUSED70,
    UNUSED71,
    UNUSED72,
    UNUSED73,
    UNUSED74,
    UNUSED75,
    UNUSED76,
    UNUSED77,
    UNUSED78,
    UNUSED79,
    UNUSED80,
    UNUSED81,
    UNUSED82,
    UNUSED83,
    UNUSED84,
    UNUSED85,
    UNUSED86,
    UNUSED87,
    UNUSED88,
    UNUSED89,
    UNUSED90,
    UNUSED91,
    UNUSED92,
    UNUSED93,
    UNUSED94,
    UNUSED95,
    UNUSED96,
    UNUSED97,
    UNUSED98,
    UNUSED99,
}

enum CardCategories {
    VIDEOGAMES,
}

globalvar all_cards;

all_cards=array_add(Cards.UNUSED99, noone);

for (var i=Cards.UNUSED11; i<=Cards.UNUSED99; i++){
    all_cards[i]=add_card('Unused'+string(i), 'default', CardCategories.VIDEOGAMES, 'A card that has yet to be filled in with information.');
}

for (var i=0; i<array_length_1d(all_cards); i++){
    all_cards[i].index=i;
}
