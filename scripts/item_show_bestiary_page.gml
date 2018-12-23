/// void item_show_bestiary_page(base item);

audio_play_sound(all_birds[argument0.item_power].cry, 1, false);

with (instantiate(ItemBestiaryPage)){
    index=argument0.item_power;
}

World.pause_is_hidden=true;
