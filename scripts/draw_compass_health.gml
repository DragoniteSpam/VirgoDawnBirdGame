/// void draw_compass_health(Entity, xx, yy);

var n=argument0.hp_current;
var s=6;

var blocks=floor(get_max_hp(argument0.exp_hp)/BASE_HP_FACTOR);
var away=floor((blocks-1)/2);

for (var i=0; i<blocks; i++){
    draw_health_unit(argument1-(away-i)*24, argument2, s, n-i*BASE_HP_FACTOR);
}
