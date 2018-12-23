/// void death_poof();

repeat(12+render_distance div 4){
    create_particle(choose(ParticleColors.GRAY, ParticleColors.GRAY2), x, y, z, -60, -60, 120, 60, 60, 180, 1, 480, 0, 0, c_gravity/2);
}

mask=COLLISION_DEAD_DEFAULT;
c_object_set_mask(object, mask, mask);
