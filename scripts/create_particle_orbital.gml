/// Particle create_particle_orbital(ParticleColor index, x, y, z, min dist, min angle, minz, max dist, max angle, maxz, scale, max spin speed, xgravity, ygravity, zgravity, [mod package], [model index]);

with (instance_create(argument[1], argument[2], ParticleOrbital)){
    if (argument_count==17){
        model=ds_map_find_value(all_mod_packages, argument[15]).my_models[argument[16]].model_array[argument[0]];
    } else {
        model=ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[Models.part_aster].model_array[argument[0]];
    }
    z=argument[3];
    distance_speed=random_range(argument[4], argument[7]);
    angle_speed=random_range(argument[5], argument[8]);
    zspeed=random_range(argument[6], argument[9]);
    scale=argument[10];
    xrotspeed=random(argument[11]);
    yrotspeed=random(argument[11]);
    zrotspeed=random(argument[11]);
    distance_gravity=argument[12];
    angle_gravity=argument[13];
    zgravity=argument[14];
    return id;
}
