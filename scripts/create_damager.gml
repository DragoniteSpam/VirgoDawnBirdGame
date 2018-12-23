/// Damager create_damager(x, y, z, strength, caster);

with (instance_create(argument0, argument1, Damager)){
    z=argument2;
    strength=argument3;
    caster=argument4;
    object=c_object_create(all_models[Models.extra_npc].shape, COLLISION_PRIMARY, COLLISION_PRIMARY);
    return id;
}
