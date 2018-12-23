/// create_arrow(x, y, z, direction, pitch, strength, caster);

var ball=instance_create(argument0, argument1, EffectArrow);

with (ball){
    z=argument2;
    zstart=argument2;
    direction=argument3;
    pitch=argument4;
    strength=argument5;
    caster=argument6;

    var base=BASE_PROJECTILE_SPEED;
    var c=log2(BASE_PROJECTILE_STRENGTH*strength)+base;
    xspeed=c*dcos(direction);
    yspeed=-c*dsin(direction);
    zspeed=-c*dsin(pitch);
    
    return id;
}
