/// EffectIceSpike create_ice_spike(x, y, z, direction, pitch, strength, caster);

var ball=instance_create(argument0, argument1, EffectIceSpike);
ball.z=argument2;
ball.direction=argument3;
ball.pitch=argument4;
ball.strength=argument5;
ball.caster=argument6;

return ball;
