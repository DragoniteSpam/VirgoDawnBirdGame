/// create_bloom_blob(x, y, z, direction, pitch, strength, caster);

var ball=instance_create(argument0, argument1, EffectGenericBlob);
ball.z=argument2;
ball.render=draw_effect_bloom_blob;
ball.direction=argument3;
ball.pitch=argument4;
ball.strength=argument5;
ball.caster=argument6;

return ball;
