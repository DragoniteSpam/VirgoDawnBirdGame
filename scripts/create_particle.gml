/// Particle create_particle(ParticleColor index, x, y, z, minx, miny, minz, maxx, maxy, maxz, scale, max spin speed, xgravity, ygravity, zgravity, [mod package], [model index]);

with (instance_create(argument[1], argument[2], Particle)){
    if (argument_count==17){
        model=ds_map_find_value(all_mod_packages, argument[15]).my_models[argument[16]].model_array[argument[0]];
    } else {
        model=ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_aster].model_array[argument[0]];
    }
    z=argument[3];
    xspeed=random_range(argument[4], argument[7]);
    yspeed=random_range(argument[5], argument[8]);
    zspeed=random_range(argument[6], argument[9]);
    scale=argument[10];
    xrotspeed=random(argument[11]);
    yrotspeed=random(argument[11]);
    zrotspeed=random(argument[11]);
    xgravity=argument[12];
    ygravity=argument[13];
    zgravity=argument[14];
    return id;
}
