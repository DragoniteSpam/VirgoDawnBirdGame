/// ParticleFadingImage create_footprint(x, y, z, direction, side);

with (instance_create(argument[0], argument[1], ParticleFadingImage)){
    z=argument[2]+1;
    direction=(argument[3]+270)%360;
    xrot=0;
    yrot=0;
    scale=0.25;
    // @todo footprints
    sprite_index=particle_footprint;
    image_index=argument[4];
    image_speed=0;
    zgravity=0;
    timer=room_speed*3;
    return id;
}
