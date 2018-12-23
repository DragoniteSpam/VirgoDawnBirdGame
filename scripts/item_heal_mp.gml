/// void item_heal_mp(base item);

var base_item=argument0;
var amount=base_item.item_power;

var max_mp=get_max_mp(Player.exp_mp);

Player.mp_current=min(max_mp, Player.mp_current+max_mp*amount);

with (Player){
    stats_update_potions();
}
