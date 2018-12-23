// this is for 2D particles, you don't really need any fancy setup for 3D particles
// because of the way I just hacked it all together

part_system_magic=part_system_create();
part_system_automatic_draw(part_system_magic, false);
part_system_automatic_update(part_system_magic, false);

part_emitter_magic=part_emitter_create(part_system_magic);
part_emitter_region(part_system_magic, part_emitter_magic, -16, 16, -16, 16, ps_shape_ellipse, ps_distr_linear);

part_type_magic1=part_type_create();
part_type_sprite(part_type_magic1, particle_magic, false, false, true);
part_type_size(part_type_magic1, 0.05, 0.15, -0.01, 0);
// this has to be /room speed instead of *delta_time_seconds because it's preset and
// doesn't udpate in real time
part_type_gravity(part_type_magic1, c_gravity/room_speed, 270);
