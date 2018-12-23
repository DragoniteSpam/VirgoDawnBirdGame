/// void item_heal_hp(base item);

var base_item=argument0;
var amount=base_item.item_power;

var max_hp=get_max_hp(Player.exp_hp);

Player.hp_current=min(max_hp, Player.hp_current+max_hp*amount);

with (Player){
    stats_update_potions();
}
