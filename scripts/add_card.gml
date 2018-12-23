#define add_card
/// Card add_card(name, file, category, description);

with (instantiate(Card, argument0)){
    image=add_card_image(argument1);
    category=argument2;
    summary=argument3;
    
    return id;
}

#define add_card_image
/// background add_card_image(file);

if (file_exists('.\books\Cards\'+argument0+'.png')){
    return background_add('.\books\Cards\'+argument0+'.png', false, false);
}

return b_card_blank;