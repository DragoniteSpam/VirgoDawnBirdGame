/// EffectWaterRing create_water_ring(x, y, z, speed);

with (instance_create(argument[0], argument[1], EffectWaterRing)){
    z=argument[2];
    rate=argument[3];
    return id;
}
