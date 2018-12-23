/// int get_card_total();

var t=0;
for (var i=0; i<array_length_1d(all_cards); i++){
    if (all_cards[i].count>0){
        t++;
    }
}

return t;
