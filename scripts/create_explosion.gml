/// EffectExplosion create_explosion(x, y, z, scale, caster, [background]);

with (instance_create(argument[0], argument[1], EffectExplosion)){
    z=argument[2];
    scale=argument[3];
    caster=argument[4];
    exp_hp=caster.exp_hp;
    exp_mp=caster.exp_mp;
    switch (argument_count){
        case 6:
            image=argument[5];
    }
    
    timer=room_speed/2;
    
    PLAY3D(se_explosion, x, y, z+64, false);
    
    return id;
}
