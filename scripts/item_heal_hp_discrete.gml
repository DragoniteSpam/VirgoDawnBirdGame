/// void item_heal_hp_discrete(base item);

var base_item=argument0;
var amount=base_item.item_power;

Player.hp_current=min(get_max_hp(Player.exp_hp), Player.hp_current+amount);

with (Player){
    stats_update_potions();
}
