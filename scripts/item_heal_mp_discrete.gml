/// void item_heal_mp_discrete(base item);

var base_item=argument0;
var amount=base_item.item_power;

Player.mp_current=min(get_max_mp(Player.exp_mp), Player.mp_current+amount);

with (Player){
    stats_update_potions();
}
