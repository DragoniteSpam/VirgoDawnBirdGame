argument0.hp-=1;

if (argument0.hp<=0){
    Player.xp+=argument0.expy;
    with (argument0){
        instance_destroy();
    }
    if (argument0==World.ray_object){
        World.ray_object=noone;
    }
}
